import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { ProductFilterDto } from './dto/product-filter.dto';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProductsService {
  constructor(private prisma: PrismaService) {}

  async findAll(filterDto: ProductFilterDto) {
    const {
      page = 1,
      limit = 20,
      search,
      categoryId,
      brandId,
      categorySlug,
      brandSlug,
      minPrice,
      maxPrice,
      sizes,
      colors,
      rating,
      isFeatured,
      sortBy = 'createdAt',
      sortOrder = 'desc',
    } = filterDto;

    const skip = (page - 1) * limit;

    // Two-pass ID collection filter evaluating relation averages exactly for rating constraints
    let ratingFilteredIds: string[] | undefined = undefined;
    if (rating !== undefined) {
      const candidateProds = await this.prisma.product.findMany({
        where: { isActive: true },
        select: { id: true, reviews: { select: { rating: true } } },
      });
      ratingFilteredIds = candidateProds
        .filter((p) => {
          const avg = p.reviews.length > 0 ? p.reviews.reduce((sum, r) => sum + r.rating, 0) / p.reviews.length : 0;
          return avg >= rating;
        })
        .map((p) => p.id);
    }

    const where: Prisma.ProductWhereInput = {
      isActive: filterDto.isActive !== undefined ? filterDto.isActive : true,
      ...(ratingFilteredIds && { id: { in: ratingFilteredIds } }),
      ...(search && {
        OR: [
          { name_tj: { contains: search, mode: 'insensitive' } },
          { name_ru: { contains: search, mode: 'insensitive' } },
          { name_en: { contains: search, mode: 'insensitive' } },
          { sku: { contains: search, mode: 'insensitive' } },
        ],
      }),
      ...(categoryId && { categoryId }),
      ...(brandId && { brandId }),
      ...(categorySlug && { category: { slug: categorySlug } }),
      ...(brandSlug && { brand: { slug: brandSlug } }),
      ...(isFeatured !== undefined && { isFeatured }),
      ...(minPrice !== undefined || maxPrice !== undefined
        ? {
            finalPrice: {
              ...(minPrice !== undefined && { gte: minPrice }),
              ...(maxPrice !== undefined && { lte: maxPrice }),
            },
          }
        : {}),
      ...(sizes?.length && {
        sizes: { some: { size: { in: sizes }, stock: { gt: 0 } } },
      }),
      ...(colors?.length && {
        colors: {
          some: {
            OR: [
              { name_tj: { in: colors } },
              { name_ru: { in: colors } },
              { name_en: { in: colors } },
            ],
          },
        },
      }),
    };

    const orderBy: Prisma.ProductOrderByWithRelationInput =
      sortBy === 'price'
        ? { finalPrice: sortOrder as Prisma.SortOrder }
        : sortBy === 'rating'
        ? { reviews: { _count: sortOrder as Prisma.SortOrder } }
        : { [sortBy]: sortOrder as Prisma.SortOrder };

    const [items, total] = await Promise.all([
      this.prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy,
        include: {
          images: {
            orderBy: [
              { isMain: 'desc' },
              { order: 'asc' },
            ],
            take: 1,
          },
          colors: true,
          sizes: true,
          category: { select: { id: true, name_tj: true, name_ru: true, name_en: true } },
          brand: { select: { id: true, name: true, logo: true } },
          _count: { select: { likes: true, reviews: true } },
          reviews: { select: { rating: true } },
        },
      }),
      this.prisma.product.count({ where }),
    ]);

    const data = items.map((p) => ({
      ...p,
      price: Number(p.price),
      finalPrice: Number(p.finalPrice),
      avgRating:
        p.reviews.length > 0
          ? p.reviews.reduce((sum, r) => sum + r.rating, 0) / p.reviews.length
          : 0,
      category: p.category ? {
        ...p.category,
        nameRu: (p.category as any).name_ru,
        nameTj: (p.category as any).name_tj,
        nameEn: (p.category as any).name_en,
      } : null,
    }));

    return {
      data,
      meta: { total, page, limit, totalPages: Math.ceil(total / limit) },
    };
  }

  async findAllAdmin(filterDto: ProductFilterDto) {
    const {
      page = 1,
      limit = 20,
      search,
      categoryId,
      brandId,
      sortBy = 'createdAt',
      sortOrder = 'desc',
      isActive,
    } = filterDto;

    const skip = (page - 1) * limit;

    const where: Prisma.ProductWhereInput = {
      ...(isActive !== undefined && { isActive }),
      ...(search && {
        OR: [
          { name_tj: { contains: search, mode: 'insensitive' } },
          { name_ru: { contains: search, mode: 'insensitive' } },
          { name_en: { contains: search, mode: 'insensitive' } },
          { sku: { contains: search, mode: 'insensitive' } },
        ],
      }),
      ...(categoryId && { categoryId }),
      ...(brandId && { brandId }),
    };

    const orderBy = { [sortBy]: sortOrder };

    const [items, total] = await Promise.all([
      this.prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy,
        include: {
          category: { select: { name_ru: true, name_tj: true, name_en: true } },
          brand: { select: { name: true } },
          images: {
            orderBy: [
              { isMain: 'desc' },
              { order: 'asc' },
            ],
            take: 1,
          },
        },
      }),
      this.prisma.product.count({ where }),
    ]);

    return {
      data: items.map((p) => ({
        ...p,
        price: Number(p.price),
        finalPrice: Number(p.finalPrice),
        category: p.category ? {
          ...p.category,
          nameRu: (p.category as any).name_ru,
          nameTj: (p.category as any).name_tj,
          nameEn: (p.category as any).name_en,
        } : null,
      })),
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
    };
  }

  async findFeatured() {
    const items = await this.prisma.product.findMany({
      where: { isActive: true, isFeatured: true },
      take: 12,
      orderBy: { createdAt: 'desc' },
      include: {
        images: {
          orderBy: [
            { isMain: 'desc' },
            { order: 'asc' },
          ],
          take: 1,
        },
        colors: true,
        sizes: true,
        category: { select: { id: true, name_tj: true, name_ru: true, name_en: true } },
        brand: { select: { id: true, name: true, logo: true } },
        _count: { select: { likes: true, reviews: true } },
        reviews: { select: { rating: true } },
      },
    });

    return items.map((p) => ({
      ...p,
      price: Number(p.price),
      finalPrice: Number(p.finalPrice),
      avgRating:
        p.reviews.length > 0
          ? p.reviews.reduce((sum, r) => sum + r.rating, 0) / p.reviews.length
          : 0,
      category: p.category ? {
        ...p.category,
        nameRu: (p.category as any).name_ru,
        nameTj: (p.category as any).name_tj,
        nameEn: (p.category as any).name_en,
      } : null,
    }));
  }

  async findBySlug(slug: string) {
    const product = await this.prisma.product.findUnique({
      where: { slug },
      include: {
        images: { orderBy: { order: 'asc' } },
        colors: true,
        sizes: true,
        category: true,
        brand: true,
        _count: { select: { likes: true, reviews: true } },
        reviews: {
          include: { user: { select: { id: true, name: true, avatar: true } } },
          orderBy: { createdAt: 'desc' },
        },
      },
    });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const avgRating =
      product.reviews.length > 0
        ? product.reviews.reduce((sum, r) => sum + r.rating, 0) / product.reviews.length
        : 0;

    return { 
      ...product, 
      price: Number(product.price), 
      finalPrice: Number(product.finalPrice), 
      avgRating,
      category: product.category ? {
        ...product.category,
        nameRu: (product.category as any).name_ru,
        nameTj: (product.category as any).name_tj,
        nameEn: (product.category as any).name_en,
      } : null,
    };
  }

  async findById(id: string) {
    const product = await this.prisma.product.findUnique({
      where: { id },
      include: {
        images: { orderBy: { order: 'asc' } },
        colors: true,
        sizes: true,
        category: true,
        brand: true,
        _count: { select: { likes: true, reviews: true } },
        reviews: {
          include: { user: { select: { id: true, name: true, avatar: true } } },
          orderBy: { createdAt: 'desc' },
        },
      },
    });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const avgRating =
      product.reviews.length > 0
        ? product.reviews.reduce((sum, r) => sum + r.rating, 0) / product.reviews.length
        : 0;

    return { 
      ...product, 
      price: Number(product.price), 
      finalPrice: Number(product.finalPrice), 
      avgRating,
      category: product.category ? {
        ...product.category,
        nameRu: (product.category as any).name_ru,
        nameTj: (product.category as any).name_tj,
        nameEn: (product.category as any).name_en,
      } : null,
    };
  }

  async create(dto: CreateProductDto) {
    const existing = await this.prisma.product.findUnique({ where: { sku: dto.sku } });
    if (existing) throw new ConflictException('Маҳсулот бо ин SKU аллакай мавҷуд аст');

    const discountPercent = dto.discountPercent ?? 0;
    const finalPrice = dto.price * (1 - discountPercent / 100);
    const slug = dto.sku.toLowerCase() + '-' + dto.name_en.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');

    return this.prisma.product.create({
      data: {
        name_tj: dto.name_tj,
        name_ru: dto.name_ru,
        name_en: dto.name_en,
        slug,
        description_tj: dto.description_tj,
        description_ru: dto.description_ru,
        description_en: dto.description_en,
        price: dto.price,
        discountPercent,
        finalPrice,
        sku: dto.sku,
        stock: dto.stock ?? 0,
        isActive: dto.isActive ?? true,
        isFeatured: dto.isFeatured ?? false,
        categoryId: dto.categoryId,
        brandId: dto.brandId,
        colors: dto.colors ? { create: dto.colors } : undefined,
        sizes: dto.sizes ? { create: dto.sizes } : undefined,
      },
      include: { images: true, colors: true, sizes: true, category: true, brand: true },
    });
  }

  async update(id: string, dto: UpdateProductDto) {
    const product = await this.prisma.product.findUnique({ where: { id } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const discountPercent = dto.discountPercent ?? product.discountPercent;
    const price = dto.price ?? Number(product.price);
    const finalPrice = price * (1 - discountPercent / 100);

    // Sync colors if provided
    if (dto.colors) {
      await this.prisma.productColor.deleteMany({ where: { productId: id } });
    }

    // Sync sizes if provided
    if (dto.sizes) {
      await this.prisma.productSize.deleteMany({ where: { productId: id } });
    }

    const { colors, sizes, ...restDto } = dto;

    return this.prisma.product.update({
      where: { id },
      data: {
        ...restDto,
        discountPercent,
        finalPrice,
        colors: colors ? { create: colors } : undefined,
        sizes: sizes ? { create: sizes } : undefined,
      },
      include: { images: true, colors: true, sizes: true, category: true, brand: true },
    });
  }

  async remove(id: string) {
    const product = await this.prisma.product.findUnique({ where: { id } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');
    await this.prisma.product.delete({ where: { id } });
    return { message: 'Маҳсулот нест карда шуд' };
  }

  async addImage(productId: string, url: string, isMain: boolean) {
    const product = await this.prisma.product.findUnique({ where: { id: productId } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    if (isMain) {
      await this.prisma.productImage.updateMany({
        where: { productId },
        data: { isMain: false },
      });
    }

    const count = await this.prisma.productImage.count({ where: { productId } });
    return this.prisma.productImage.create({
      data: { url, isMain, order: count, productId },
    });
  }

  async removeImage(productId: string, imageId: string) {
    const image = await this.prisma.productImage.findFirst({ where: { id: imageId, productId } });
    if (!image) throw new NotFoundException('Тасвир ёфт нашуд');
    await this.prisma.productImage.delete({ where: { id: imageId } });
    return { message: 'Тасвир нест карда шуд' };
  }
}
