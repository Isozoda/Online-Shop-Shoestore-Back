import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';

@Injectable()
export class CategoriesService {
  constructor(private prisma: PrismaService) {}

  async findAll() {
    const categories = await this.prisma.category.findMany({
      include: {
        _count: { select: { products: true } },
      },
      orderBy: { name_ru: 'asc' },
    });

    return categories.map((c) => ({
      ...c,
      nameRu: c.name_ru,
      nameTj: c.name_tj,
      nameEn: c.name_en,
    }));
  }

  async findBySlug(slug: string) {
    const category = await this.prisma.category.findUnique({
      where: { slug },
      include: { children: true, _count: { select: { products: true } } },
    });
    if (!category) throw new NotFoundException('Категория ёфт нашуд');
    return category;
  }

  async create(dto: CreateCategoryDto) {
    const existing = await this.prisma.category.findUnique({ where: { slug: dto.slug } });
    if (existing) throw new ConflictException('Категория бо ин slug аллакай мавҷуд аст');
    return this.prisma.category.create({ data: dto });
  }

  async update(id: string, dto: UpdateCategoryDto) {
    const category = await this.prisma.category.findUnique({ where: { id } });
    if (!category) throw new NotFoundException('Категория ёфт нашуд');
    return this.prisma.category.update({ where: { id }, data: dto });
  }

  async remove(id: string) {
    const category = await this.prisma.category.findUnique({
      where: { id },
      include: {
        _count: {
          select: {
            products: true,
            children: true,
          },
        },
      },
    });

    if (!category) throw new NotFoundException('Категория ёфт нашуд');

    if (category._count.products > 0) {
      throw new ConflictException('Категорияро нест кардан мумкин нест, зеро он дорои маҳсулот аст');
    }

    if (category._count.children > 0) {
      throw new ConflictException('Категорияро нест кардан мумкин нест, зеро он дорои зерпопкаҳо мебошад');
    }

    await this.prisma.category.delete({ where: { id } });
    return { message: 'Категория нест карда шуд' };
  }
}
