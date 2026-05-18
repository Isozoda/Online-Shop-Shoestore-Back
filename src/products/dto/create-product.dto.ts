import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsString,
  IsNotEmpty,
  IsOptional,
  IsNumber,
  IsBoolean,
  IsArray,
  Min,
  Max,
  ValidateNested,
} from 'class-validator';
import { Type } from 'class-transformer';

class ColorDto {
  @IsString() name_tj: string;
  @IsString() name_ru: string;
  @IsString() name_en: string;
  @IsString() hexCode: string;
}

class SizeDto {
  @IsString() size: string;
  @IsNumber() @Min(0) stock: number;
}

export class CreateProductDto {
  @ApiProperty() @IsString() @IsNotEmpty() name_tj: string;
  @ApiProperty() @IsString() @IsNotEmpty() name_ru: string;
  @ApiProperty() @IsString() @IsNotEmpty() name_en: string;
  @ApiPropertyOptional() @IsString() @IsOptional() description_tj?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() description_ru?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() description_en?: string;

  @ApiProperty() @IsNumber() @Min(0) @Type(() => Number) price: number;
  @ApiPropertyOptional({ default: 0 }) @IsNumber() @Min(0) @Max(100) @IsOptional() @Type(() => Number) discountPercent?: number;

  @ApiProperty() @IsString() @IsNotEmpty() sku: string;
  @ApiPropertyOptional({ default: 0 }) @IsNumber() @Min(0) @IsOptional() @Type(() => Number) stock?: number;

  @ApiProperty() @IsString() @IsNotEmpty() categoryId: string;
  @ApiPropertyOptional() @IsString() @IsOptional() brandId?: string;

  @ApiPropertyOptional({ default: false }) @IsBoolean() @IsOptional() isActive?: boolean;
  @ApiPropertyOptional({ default: false }) @IsBoolean() @IsOptional() isFeatured?: boolean;

  @ApiPropertyOptional({ type: [ColorDto] })
  @IsArray()
  @IsOptional()
  @ValidateNested({ each: true })
  @Type(() => ColorDto)
  colors?: ColorDto[];

  @ApiPropertyOptional({ type: [SizeDto] })
  @IsArray()
  @IsOptional()
  @ValidateNested({ each: true })
  @Type(() => SizeDto)
  sizes?: SizeDto[];
}
