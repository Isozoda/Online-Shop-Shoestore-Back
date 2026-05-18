import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsOptional, IsEmail } from 'class-validator';

export class UpdateSettingsDto {
  @ApiPropertyOptional() @IsString() @IsOptional() telegramBotToken?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() telegramChatId?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() whatsappNumber?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeName_tj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeName_ru?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeName_en?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storePhone?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeAddress_tj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeAddress_ru?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() storeAddress_en?: string;
  @ApiPropertyOptional() @IsEmail() @IsOptional() storeEmail?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() logo?: string;
}
