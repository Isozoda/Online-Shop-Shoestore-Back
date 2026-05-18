import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateBannerDto } from './dto/create-banner.dto';

@Injectable()
export class BannersService {
  constructor(private prisma: PrismaService) {}

  private mapToCamelCase(banner: any) {
    return {
      id: banner.id,
      titleRu: banner.title_ru,
      titleTj: banner.title_tj,
      titleEn: banner.title_en,
      subtitleRu: banner.subtitle_ru,
      subtitleTj: banner.subtitle_tj,
      subtitleEn: banner.subtitle_en,
      buttonTextRu: banner.buttonText_ru,
      buttonTextTj: banner.buttonText_tj,
      buttonTextEn: banner.buttonText_en,
      image: banner.image,
      link: banner.link,
      order: banner.order,
      isActive: banner.isActive,
      createdAt: banner.createdAt,
    };
  }

  private mapToSnakeCase(dto: any) {
    return {
      title_ru: dto.titleRu,
      title_tj: dto.titleTj,
      title_en: dto.titleEn,
      subtitle_ru: dto.subtitleRu,
      subtitle_tj: dto.subtitleTj,
      subtitle_en: dto.subtitleEn,
      buttonText_ru: dto.buttonTextRu,
      buttonText_tj: dto.buttonTextTj,
      buttonText_en: dto.buttonTextEn,
      image: dto.image,
      link: dto.link,
      order: dto.order,
      isActive: dto.isActive,
    };
  }

  async findActive() {
    const banners = await this.prisma.banner.findMany({
      where: { isActive: true },
      orderBy: { order: 'asc' },
    });
    return banners.map((b) => this.mapToCamelCase(b));
  }

  async findAll() {
    const banners = await this.prisma.banner.findMany({
      orderBy: { order: 'asc' },
    });
    return banners.map((b) => this.mapToCamelCase(b));
  }

  async create(dto: CreateBannerDto) {
    const data = this.mapToSnakeCase(dto);
    const banner = await this.prisma.banner.create({ data });
    return this.mapToCamelCase(banner);
  }

  async update(id: string, dto: Partial<CreateBannerDto>) {
    const banner = await this.prisma.banner.findUnique({ where: { id } });
    if (!banner) throw new NotFoundException('Баннер ёфт нашуд');
    
    const data = this.mapToSnakeCase(dto);
    const updated = await this.prisma.banner.update({
      where: { id },
      data,
    });
    return this.mapToCamelCase(updated);
  }

  async remove(id: string) {
    const banner = await this.prisma.banner.findUnique({ where: { id } });
    if (!banner) throw new NotFoundException('Баннер ёфт нашуд');
    await this.prisma.banner.delete({ where: { id } });
    return { message: 'Баннер нест карда шуд' };
  }

  async reorder(ids: string[]) {
    await Promise.all(
      ids.map((id, index) =>
        this.prisma.banner.update({
          where: { id },
          data: { order: index },
        }),
      ),
    );
    return { message: 'Тартиб иваз карда шуд' };
  }
}
