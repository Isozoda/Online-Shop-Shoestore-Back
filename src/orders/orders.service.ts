import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { TelegramService } from '../telegram/telegram.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderStatusDto } from './dto/update-order-status.dto';

@Injectable()
export class OrdersService {
  constructor(
    private prisma: PrismaService,
    private telegramService: TelegramService,
  ) {}

  async create(dto: CreateOrderDto) {
    if (!dto.items || dto.items.length === 0) {
      throw new BadRequestException('Сабад холӣ аст');
    }

    const productIds = dto.items.map((i) => i.productId);
    const products = await this.prisma.product.findMany({
      where: { id: { in: productIds } },
    });

    const validItems = dto.items.filter((item) => products.some((p) => p.id === item.productId));

    if (validItems.length === 0) {
      throw new BadRequestException('Маҳсулотҳои интихобшуда дар база ёфт нашуданд ё ба фурӯш рафтааст. Лутфан сабадро навсозӣ кунед.');
    }

    const orderItems = validItems.map((item) => {
      const product = products.find((p) => p.id === item.productId);
      const purchasePrice = product!.finalPrice ? Number(product!.finalPrice.toString()) : Number(product!.price.toString());
      return {
        productId: item.productId,
        quantity: item.quantity,
        size: item.size,
        colorName: item.colorName,
        price: purchasePrice,
      };
    });

    const totalAmount = orderItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
    const orderNumber = `ORD-${Date.now()}-${Math.floor(Math.random() * 1000)}`;

    const order = await this.prisma.order.create({
      data: {
        orderNumber,
        clientName: dto.clientName,
        clientPhone: dto.clientPhone,
        clientAddress: dto.clientAddress,
        contactMethod: dto.contactMethod,
        note: dto.note,
        totalAmount,
        userId: dto.userId,
        items: { create: orderItems },
      },
      include: {
        items: { include: { product: { select: { name_ru: true, name_tj: true } } } },
      },
    });

    try {
      await this.telegramService.sendOrderNotification({
        orderNumber: order.orderNumber,
        clientName: order.clientName,
        clientPhone: order.clientPhone,
        contactMethod: order.contactMethod,
        totalAmount: Number(order.totalAmount),
        items: order.items.map((i) => ({
          productName: i.product.name_ru || i.product.name_tj || 'Маҳсулот',
          quantity: i.quantity,
          size: i.size,
          price: Number(i.price),
        })),
        note: order.note ?? undefined,
      });
    } catch (err: any) {
      console.warn('Telegram notification transport timeout/failure skipped:', err?.message);
    }

    return order;
  }

  async getMyOrders(userId: string) {
    const orders = await this.prisma.order.findMany({
      where: { userId },
      include: {
        items: {
          include: {
            product: {
              include: {
                images: { where: { isMain: true }, take: 1 },
                category: { select: { name_ru: true, name_tj: true } },
              },
            },
          },
        },
        user: { select: { id: true, name: true, phone: true, avatar: true } },
      },
      orderBy: { createdAt: 'desc' },
    });

    return orders.map(order => ({
      ...order,
      totalAmount: Number(order.totalAmount),
      items: order.items.map(item => ({
        ...item,
        price: Number(item.price)
      }))
    }));
  }

  async findAll(page = 1, limit = 20, status?: string) {
    const skip = (page - 1) * limit;
    const where = status ? { status: status as any } : {};

    const [items, total] = await Promise.all([
      this.prisma.order.findMany({
        where,
        skip,
        take: limit,
        include: {
          items: {
            include: {
              product: {
                include: {
                  images: { where: { isMain: true }, take: 1 },
                  category: { select: { name_ru: true, name_tj: true } },
                }
              }
            }
          },
          user: { select: { id: true, name: true, phone: true, avatar: true } }
        },
        orderBy: { createdAt: 'desc' },
      }),
      this.prisma.order.count({ where }),
    ]);

    const mappedItems = items.map(order => ({
      ...order,
      totalAmount: Number(order.totalAmount),
      items: order.items.map(item => ({
        ...item,
        price: Number(item.price)
      }))
    }));

    return {
      data: mappedItems,
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
    };
  }

  async findOne(id: string) {
    const order = await this.prisma.order.findUnique({
      where: { id },
      include: {
        items: {
          include: {
            product: {
              include: {
                images: { where: { isMain: true }, take: 1 },
                category: { select: { name_ru: true, name_tj: true } },
              },
            },
          },
        },
        user: { select: { id: true, name: true, phone: true, avatar: true } },
      },
    });
    if (!order) throw new NotFoundException('Фармоиш ёфт нашуд');
    
    return {
      ...order,
      totalAmount: Number(order.totalAmount),
      items: order.items.map(item => ({
        ...item,
        price: Number(item.price)
      }))
    };
  }

  async updateStatus(id: string, dto: UpdateOrderStatusDto) {
    const order = await this.prisma.order.findUnique({ where: { id } });
    if (!order) throw new NotFoundException('Фармоиш ёфт нашуд');
    return this.prisma.order.update({
      where: { id },
      data: { status: dto.status },
    });
  }
}
