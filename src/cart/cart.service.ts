import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { AddToCartDto } from './dto/add-to-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';

@Injectable()
export class CartService {
  constructor(private prisma: PrismaService) {}

  async getCart(userId: string) {
    const items = await this.prisma.cartItem.findMany({
      where: { userId },
      include: {
        product: {
          include: {
            images: { where: { isMain: true }, take: 1 },
            colors: true,
          },
        },
      },
      orderBy: { createdAt: 'desc' },
    });

    const total = items.reduce((sum, item) => {
      return sum + Number(item.product.finalPrice) * item.quantity;
    }, 0);

    return { items, total, count: items.length };
  }

  async addToCart(userId: string, dto: AddToCartDto) {
    const product = await this.prisma.product.findUnique({ where: { id: dto.productId } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const existing = await this.prisma.cartItem.findFirst({
      where: { userId, productId: dto.productId, size: dto.size, colorId: dto.colorId },
    });

    if (existing) {
      return this.prisma.cartItem.update({
        where: { id: existing.id },
        data: { quantity: existing.quantity + dto.quantity },
        include: { product: { include: { images: { where: { isMain: true }, take: 1 } } } },
      });
    }

    return this.prisma.cartItem.create({
      data: {
        userId,
        productId: dto.productId,
        size: dto.size,
        colorId: dto.colorId,
        quantity: dto.quantity,
      },
      include: { product: { include: { images: { where: { isMain: true }, take: 1 } } } },
    });
  }

  async updateCartItem(userId: string, itemId: string, dto: UpdateCartDto) {
    const item = await this.prisma.cartItem.findFirst({ where: { id: itemId, userId } });
    if (!item) throw new NotFoundException('Маводи сабад ёфт нашуд');
    return this.prisma.cartItem.update({ where: { id: itemId }, data: { quantity: dto.quantity } });
  }

  async removeFromCart(userId: string, itemId: string) {
    const item = await this.prisma.cartItem.findFirst({ where: { id: itemId, userId } });
    if (!item) throw new NotFoundException('Маводи сабад ёфт нашуд');
    await this.prisma.cartItem.delete({ where: { id: itemId } });
    return { message: 'Маводи сабад нест карда шуд' };
  }

  async clearCart(userId: string) {
    await this.prisma.cartItem.deleteMany({ where: { userId } });
    return { message: 'Сабад тоза карда шуд' };
  }
}
