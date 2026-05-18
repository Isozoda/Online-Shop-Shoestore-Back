import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsNumber, Min, IsUUID } from 'class-validator';
import { Type } from 'class-transformer';

export class AddToCartDto {
  @ApiProperty() @IsUUID() productId: string;
  @ApiProperty() @IsString() @IsNotEmpty() size: string;
  @ApiProperty() @IsUUID() colorId: string;

  @ApiProperty({ default: 1 })
  @IsNumber()
  @Min(1)
  @Type(() => Number)
  quantity: number = 1;
}
