import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateSettingsDto } from './dto/update-settings.dto';

@Injectable()
export class SettingsService {
  constructor(private prisma: PrismaService) {}

  async findOrCreate() {
    const existing = await this.prisma.settings.findFirst();
    if (existing) return existing;

    return this.prisma.settings.create({
      data: {
        telegramBotToken: '',
        telegramChatId: '',
        whatsappNumber: '',
        storeName_tj: 'Мағозаи пойафзоли занона',
        storeName_ru: 'Магазин женской обуви',
        storeName_en: "Women's Shoe Store",
        storePhone: '',
      },
    });
  }

  async update(dto: UpdateSettingsDto) {
    const settings = await this.findOrCreate();
    return this.prisma.settings.update({
      where: { id: settings.id },
      data: dto,
    });
  }
}
