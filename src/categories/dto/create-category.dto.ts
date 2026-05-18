import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsOptional } from 'class-validator';

export class CreateCategoryDto {
  @ApiProperty() @IsString() @IsNotEmpty() name_tj: string;
  @ApiProperty() @IsString() @IsNotEmpty() name_ru: string;
  @ApiProperty() @IsString() @IsNotEmpty() name_en: string;
  @ApiProperty() @IsString() @IsNotEmpty() slug: string;
  @ApiPropertyOptional() @IsString() @IsOptional() image?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() parentId?: string;
}
