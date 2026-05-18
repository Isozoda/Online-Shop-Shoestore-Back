import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsOptional, IsBoolean, IsNumber, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateBannerDto {
  @ApiPropertyOptional() @IsString() @IsOptional() titleRu?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() titleTj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() titleEn?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() subtitleRu?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() subtitleTj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() subtitleEn?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() buttonTextRu?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() buttonTextTj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() buttonTextEn?: string;
  @ApiProperty() @IsString() @IsNotEmpty() image: string;
  @ApiPropertyOptional() @IsString() @IsOptional() link?: string;
  @ApiPropertyOptional({ default: true }) @IsBoolean() @IsOptional() isActive?: boolean;
  @ApiPropertyOptional({ default: 0 }) @IsNumber() @Min(0) @IsOptional() @Type(() => Number) order?: number;
}
