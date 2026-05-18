import { Controller, Post, Body, Res, UseGuards, Req } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse, ApiBearerAuth } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';
import { JwtRefreshGuard } from '../common/guards/jwt-refresh.guard';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { Response, Request } from 'express';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  @ApiOperation({ summary: 'Қайди корбари нав' })
  @ApiResponse({ status: 201, description: 'Корбар муваффақона қайд шуд' })
  @ApiResponse({ status: 409, description: 'Рақами телефон аллакай мавҷуд аст' })
  register(@Body() dto: RegisterDto) {
    return this.authService.register(dto);
  }

  @Post('login')
  @ApiOperation({ summary: 'Даромадан ба система' })
  @ApiResponse({ status: 200, description: 'Муваффақона даромад' })
  @ApiResponse({ status: 401, description: 'Рақам ё парол нодуруст' })
  login(@Body() dto: LoginDto, @Res({ passthrough: true }) res: Response) {
    return this.authService.login(dto, res);
  }

  @Post('refresh')
  @UseGuards(JwtRefreshGuard)
  @ApiOperation({ summary: 'Навкунии access token' })
  @ApiResponse({ status: 200, description: 'Token навшуд' })
  refresh(@CurrentUser('id') userId: string, @Res({ passthrough: true }) res: Response) {
    return this.authService.refresh(userId, res);
  }

  @Post('logout')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Баромадан аз система' })
  @ApiResponse({ status: 200, description: 'Муваффақона баромад' })
  logout(
    @CurrentUser('id') userId: string,
    @Req() req: Request,
    @Res({ passthrough: true }) res: Response,
  ) {
    const refreshToken = req.cookies?.refreshToken ?? '';
    return this.authService.logout(userId, refreshToken, res);
  }
}
