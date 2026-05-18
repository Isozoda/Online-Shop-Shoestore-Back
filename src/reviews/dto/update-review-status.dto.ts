import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsIn } from 'class-validator';

export class UpdateReviewStatusDto {
  @ApiProperty({ example: 'APPROVED' })
  @IsString()
  @IsNotEmpty()
  @IsIn(['PENDING', 'APPROVED', 'REJECTED'])
  status: string;
}
