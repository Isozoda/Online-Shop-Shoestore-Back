import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsEnum, IsOptional, IsArray, ValidateNested, IsNumber, IsUUID, Min } from 'class-validator';
import { Type } from 'class-transformer';
import { ContactMethod } from '@prisma/client';

class OrderItemDto {
  @IsUUID() productId: string;
  @IsNumber() @Min(1) quantity: number;
  @IsString() @IsNotEmpty() size: string;
  @IsString() @IsNotEmpty() colorName: string;
}

export class CreateOrderDto {
  @ApiProperty() @IsString() @IsNotEmpty() clientName: string;
  @ApiProperty() @IsString() @IsNotEmpty() clientPhone: string;
  @ApiPropertyOptional() @IsString() @IsOptional() clientAddress?: string;
  @ApiPropertyOptional() @IsString() @IsOptional() note?: string;

  @ApiProperty({ enum: ContactMethod })
  @IsEnum(ContactMethod)
  contactMethod: ContactMethod;

  @ApiProperty({ type: [OrderItemDto] })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => OrderItemDto)
  items: OrderItemDto[];

  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  userId?: string;
}
