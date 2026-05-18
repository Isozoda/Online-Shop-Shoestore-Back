import { Injectable, NotFoundException, ForbiddenException, ConflictException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateReviewDto } from './dto/create-review.dto';

@Injectable()
export class ReviewsService {
  constructor(private prisma: PrismaService) {}

  async create(userId: string, dto: CreateReviewDto) {
    const product = await this.prisma.product.findUnique({ where: { id: dto.productId } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const existing = await this.prisma.review.findUnique({
      where: { userId_productId: { userId, productId: dto.productId } },
    });

    if (existing) {
      return this.prisma.review.update({
        where: { id: existing.id },
        data: { rating: dto.rating, comment: dto.comment },
        include: { user: { select: { id: true, name: true, avatar: true } } },
      });
    }

    return this.prisma.review.create({
      data: { userId, productId: dto.productId, rating: dto.rating, comment: dto.comment },
      include: { user: { select: { id: true, name: true, avatar: true } } },
    });
  }

  async getProductReviews(productId: string) {
    const product = await this.prisma.product.findUnique({ where: { id: productId } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const reviews = await this.prisma.review.findMany({
      where: { productId },
      include: { user: { select: { id: true, name: true, avatar: true } } },
      orderBy: { createdAt: 'desc' },
    });

    const avgRating =
      reviews.length > 0
        ? reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length
        : 0;

    return { reviews, avgRating: Math.round(avgRating * 10) / 10, total: reviews.length };
  }

  async getLatestReviews() {
    return this.prisma.review.findMany({
      take: 10,
      orderBy: { updatedAt: 'desc' },
      include: {
        user: { select: { id: true, name: true, avatar: true } },
        product: { select: { id: true, name_tj: true, name_ru: true, name_en: true, slug: true, images: { select: { url: true, isMain: true } } } },
      },
    });
  }

  async remove(userId: string, reviewId: string, userRole: string) {
    const review = await this.prisma.review.findUnique({ where: { id: reviewId } });
    if (!review) throw new NotFoundException('Шарҳ ёфт нашуд');

    if (review.userId !== userId && userRole !== 'ADMIN') {
      throw new ForbiddenException('Ин амал барои шумо иҷозат дода нашудааст');
    }

    await this.prisma.review.delete({ where: { id: reviewId } });
    return { message: 'Шарҳ нест карда шуд' };
  }

  async findAll(status?: string) {
    const where: any = {};
    if (status && status !== 'ALL') {
      where.status = status;
    }
    const items = await this.prisma.review.findMany({
      where,
      include: {
        user: { select: { id: true, name: true, avatar: true, phone: true } },
        product: {
          select: {
            id: true,
            name_tj: true,
            name_ru: true,
            name_en: true,
            slug: true,
            sku: true,
            images: { select: { url: true, isMain: true } },
          },
        },
      },
      orderBy: { createdAt: 'desc' },
    });

    return {
      data: items,
      total: items.length,
      page: 1,
      limit: items.length,
      totalPages: 1,
    };
  }

  async updateStatus(id: string, status: string) {
    const review = await this.prisma.review.findUnique({ where: { id } });
    if (!review) throw new NotFoundException('Шарҳ ёфт нашуд');

    return this.prisma.review.update({
      where: { id },
      data: { status },
      include: {
        user: { select: { id: true, name: true, avatar: true, phone: true } },
        product: {
          select: {
            id: true,
            name_tj: true,
            name_ru: true,
            name_en: true,
            slug: true,
            sku: true,
            images: { select: { url: true, isMain: true } },
          },
        },
      },
    });
  }
}
