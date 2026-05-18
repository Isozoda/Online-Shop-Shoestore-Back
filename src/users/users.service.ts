import {
  Injectable,
  NotFoundException,
  BadRequestException,
  ConflictException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateProfileDto } from './dto/update-profile.dto';
import { ChangePasswordDto } from './dto/change-password.dto';
import * as bcrypt from 'bcrypt';
import { UsersQueryDto } from './dto/users-query.dto';
import { Role } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  async getMe(userId: string) {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: {
        id: true,
        name: true,
        phone: true,
        email: true,
        avatar: true,
        role: true,
        createdAt: true,
        _count: { select: { orders: true, likes: true, reviews: true } },
      },
    });
    if (!user) throw new NotFoundException('Корбар ёфт нашуд');
    return user;
  }

  async updateProfile(userId: string, dto: UpdateProfileDto) {
    if (dto.phone) {
      const existing = await this.prisma.user.findUnique({ where: { phone: dto.phone } });
      if (existing && existing.id !== userId) throw new ConflictException('Ин рақам аллакай истифода мешавад');
    }
    if (dto.email) {
      const existing = await this.prisma.user.findFirst({ where: { email: dto.email } });
      if (existing && existing.id !== userId) throw new ConflictException('Ин email аллакай истифода мешавад');
    }
    return this.prisma.user.update({
      where: { id: userId },
      data: dto,
      select: { id: true, name: true, phone: true, email: true, avatar: true, role: true },
    });
  }

  async changePassword(userId: string, dto: ChangePasswordDto) {
    const user = await this.prisma.user.findUnique({ where: { id: userId } });
    if (!user) throw new NotFoundException('Корбар ёфт нашуд');

    const isMatch = await bcrypt.compare(dto.currentPassword, user.passwordHash);
    if (!isMatch) throw new BadRequestException('Пароли кунунӣ нодуруст аст');

    const passwordHash = await bcrypt.hash(dto.newPassword, 12);
    await this.prisma.user.update({ where: { id: userId }, data: { passwordHash } });
    return { message: 'Парол муваффақона тағйир ёфт' };
  }

  async updateAvatar(userId: string, avatarUrl: string) {
    return this.prisma.user.update({
      where: { id: userId },
      data: { avatar: avatarUrl },
      select: { id: true, avatar: true },
    });
  }

  async findAll(query: UsersQueryDto) {
    const { page = 1, limit = 20, search, role } = query;
    const skip = (page - 1) * limit;

    const where: any = {};

    if (role) {
      where.role = role;
    }

    if (search) {
      where.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { email: { contains: search, mode: 'insensitive' } },
        { phone: { contains: search, mode: 'insensitive' } },
      ];
    }

    const [total, items] = await Promise.all([
      this.prisma.user.count({ where }),
      this.prisma.user.findMany({
        where,
        select: {
          id: true,
          name: true,
          phone: true,
          email: true,
          avatar: true,
          role: true,
          createdAt: true,
          _count: { select: { orders: true } },
        },
        orderBy: { createdAt: 'desc' },
        skip,
        take: limit,
      }),
    ]);

    return {
      data: items,
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
    };
  }

  async findOne(id: string) {
    const user = await this.prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        name: true,
        phone: true,
        email: true,
        avatar: true,
        role: true,
        createdAt: true,
        orders: { orderBy: { createdAt: 'desc' }, take: 10 },
        _count: { select: { orders: true, likes: true, reviews: true } },
      },
    });
    if (!user) throw new NotFoundException('Корбар ёфт нашуд');
    return user;
  }

  async remove(id: string) {
    const user = await this.prisma.user.findUnique({ where: { id } });
    if (!user) throw new NotFoundException('Корбар ёфт нашуд');
    await this.prisma.user.delete({ where: { id } });
    return { message: 'Корбар нест карда шуд' };
  }

  async updateRole(id: string, newRole: Role, currentAdminId: string) {
    const user = await this.prisma.user.findUnique({ where: { id } });
    if (!user) throw new NotFoundException('Корбар ёфт нашуд');

    if (id === currentAdminId && newRole !== Role.ADMIN) {
      throw new BadRequestException('Шумо наметавонед нақши админи худро тағйир диҳед');
    }

    return this.prisma.user.update({
      where: { id },
      data: { role: newRole },
      select: {
        id: true,
        name: true,
        phone: true,
        email: true,
        avatar: true,
        role: true,
        createdAt: true,
      },
    });
  }
}
