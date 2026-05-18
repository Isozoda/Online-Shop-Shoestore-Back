import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class LikesService {
  constructor(private prisma: PrismaService) {}

  async toggle(userId: string, productId: string) {
    const product = await this.prisma.product.findUnique({ where: { id: productId } });
    if (!product) throw new NotFoundException('Маҳсулот ёфт нашуд');

    const existing = await this.prisma.like.findUnique({
      where: { userId_productId: { userId, productId } },
    });

    if (existing) {
      await this.prisma.like.delete({ where: { id: existing.id } });
      return { liked: false, message: 'Аз дӯстдоштаҳо хориҷ карда шуд' };
    }

    await this.prisma.like.create({ data: { userId, productId } });
    return { liked: true, message: 'Ба дӯстдоштаҳо илова карда шуд' };
  }

  async getMyLikes(userId: string) {
    return this.prisma.like.findMany({
      where: { userId },
      include: {
        product: {
          include: {
            images: { where: { isMain: true }, take: 1 },
            colors: true,
            sizes: true,
            _count: { select: { likes: true } },
          },
        },
      },
      orderBy: { createdAt: 'desc' },
    });
  }
}
