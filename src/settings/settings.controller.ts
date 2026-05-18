import { Controller, Get, Patch, Post, Body, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { SettingsService } from './settings.service';
import { TelegramService } from '../telegram/telegram.service';
import { UpdateSettingsDto } from './dto/update-settings.dto';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { RolesGuard } from '../common/guards/roles.guard';
import { Roles } from '../common/decorators/roles.decorator';
import { Role } from '@prisma/client';

@ApiTags('settings')
@Controller('settings')
export class SettingsController {
  constructor(
    private readonly settingsService: SettingsService,
    private readonly telegramService: TelegramService,
  ) {}

  @Get()
  @ApiOperation({ summary: 'Танзимоти мағоза' })
  findAll() {
    return this.settingsService.findOrCreate();
  }

  @Patch()
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(Role.ADMIN)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Тағйир додани танзимот (ADMIN)' })
  update(@Body() dto: UpdateSettingsDto) {
    return this.settingsService.update(dto);
  }

  @Post('telegram/test')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(Role.ADMIN)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Тест кардани Telegram Бот' })
  async testTelegram() {
    await this.telegramService.sendMessage('🔔 Салом! Ин паёми санҷишӣ аз панели идоракунии мағозаи пойафзол мебошад.');
    return { success: true };
  }
}
