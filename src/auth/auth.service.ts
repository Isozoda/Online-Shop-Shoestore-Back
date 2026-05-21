import { Injectable, ConflictException, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { PrismaService } from '../prisma/prisma.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';
import * as bcrypt from 'bcrypt';
import { Response } from 'express';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwtService: JwtService,
    private config: ConfigService,
  ) {}

  async register(dto: RegisterDto) {
    const exists = await this.prisma.user.findUnique({ where: { phone: dto.phone } });
    if (exists) throw new ConflictException('Ин рақами телефон аллакай қайд шудааст');

    const passwordHash = await bcrypt.hash(dto.password, 12);
    const adminCount = await this.prisma.user.count({ where: { role: 'ADMIN' } });
    
    // Auto-promote specific phone numbers or if no admin exists
    const cleanPhone = dto.phone.replace(/[^0-9]/g, '');
    const isAdminPhone = ['992205686874', '992205686884', '205686874', '205686884'].includes(cleanPhone);
    const role = (adminCount === 0 || isAdminPhone) ? 'ADMIN' : 'USER';

    const user = await this.prisma.user.create({
      data: { name: dto.name, phone: dto.phone, email: dto.email, passwordHash, role },
      select: { id: true, name: true, phone: true, role: true, createdAt: true },
    });

    const tokens = await this.generateTokens(user.id, user.role);
    await this.saveRefreshToken(user.id, tokens.refreshToken);

    return {
      accessToken: tokens.accessToken,
      user,
    };
  }

  async login(dto: LoginDto, res: Response) {
    const user = await this.prisma.user.findUnique({ where: { phone: dto.phone } });
    if (!user) throw new UnauthorizedException('Рақам ё парол нодуруст');

    const isMatch = await bcrypt.compare(dto.password, user.passwordHash);
    if (!isMatch) throw new UnauthorizedException('Рақам ё парол нодуруст');

    // Auto-upgrade if no ADMIN exists or if specific admin phone number is used
    let finalRole = user.role;
    const adminCount = await this.prisma.user.count({ where: { role: 'ADMIN' } });
    const cleanPhone = user.phone.replace(/[^0-9]/g, '');
    const isAdminPhone = ['992205686874', '992205686884', '205686874', '205686884'].includes(cleanPhone);
    
    if ((adminCount === 0 || isAdminPhone) && user.role !== 'ADMIN') {
      await this.prisma.user.update({ where: { id: user.id }, data: { role: 'ADMIN' } });
      finalRole = 'ADMIN';
    }

    const tokens = await this.generateTokens(user.id, finalRole);
    await this.saveRefreshToken(user.id, tokens.refreshToken);

    const isProd = process.env.NODE_ENV === 'production';
    res.cookie('refreshToken', tokens.refreshToken, {
      httpOnly: true,
      secure: isProd,
      sameSite: isProd ? 'none' : 'lax',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return {
      accessToken: tokens.accessToken,
      user: { id: user.id, name: user.name, phone: user.phone, role: finalRole },
    };
  }

  async refresh(userId: string, res: Response) {
    const user = await this.prisma.user.findUnique({ where: { id: userId } });
    if (!user) throw new UnauthorizedException('Корбар ёфт нашуд');

    const tokens = await this.generateTokens(user.id, user.role);
    await this.saveRefreshToken(user.id, tokens.refreshToken);

    const isProd = process.env.NODE_ENV === 'production';
    res.cookie('refreshToken', tokens.refreshToken, {
      httpOnly: true,
      secure: isProd,
      sameSite: isProd ? 'none' : 'lax',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return { accessToken: tokens.accessToken };
  }

  async logout(userId: string, refreshToken: string, res: Response) {
    await this.prisma.refreshToken.deleteMany({ where: { userId, token: refreshToken } });
    const isProd = process.env.NODE_ENV === 'production';
    res.clearCookie('refreshToken', {
      httpOnly: true,
      secure: isProd,
      sameSite: isProd ? 'none' : 'lax',
    });
    return { message: 'Муваффақона баромад' };
  }

  private async generateTokens(userId: string, role: string) {
    const payload = { sub: userId, role };
    const [accessToken, refreshToken] = await Promise.all([
      this.jwtService.signAsync(payload, {
        secret: this.config.get<string>('JWT_ACCESS_SECRET'),
        expiresIn: '15m',
      }),
      this.jwtService.signAsync(payload, {
        secret: this.config.get<string>('JWT_REFRESH_SECRET'),
        expiresIn: '7d',
      }),
    ]);
    return { accessToken, refreshToken };
  }

  private async saveRefreshToken(userId: string, token: string) {
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7);
    await this.prisma.refreshToken.deleteMany({ where: { userId } });
    await this.prisma.refreshToken.create({ data: { token, userId, expiresAt } });
  }
}
