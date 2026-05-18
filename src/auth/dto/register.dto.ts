import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsPhoneNumber, MinLength, IsEmail, IsOptional } from 'class-validator';

export class RegisterDto {
  @ApiProperty({ example: 'Фотима Раҳимова' })
  @IsString()
  @IsNotEmpty()
  name: string;

  @ApiProperty({ example: '+992901234567' })
  @IsString()
  @IsNotEmpty()
  phone: string;

  @ApiPropertyOptional({ example: 'user@example.com' })
  @IsEmail()
  @IsOptional()
  email?: string;

  @ApiProperty({ example: 'Password123!' })
  @IsString()
  @MinLength(6)
  password: string;
}
