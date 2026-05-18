import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class DashboardService {
  constructor(private prisma: PrismaService) {}

  async getStats() {
    const now = new Date();
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
    const startOfLastMonth = new Date(now.getFullYear(), now.getMonth() - 1, 1);
    const endOfLastMonth = new Date(now.getFullYear(), now.getMonth(), 0);

    const [
      totalOrders,
      monthOrders,
      totalRevenue,
      monthRevenue,
      lastMonthRevenue,
      totalProducts,
      totalUsers,
      pendingOrders,
      recentOrders,
      topProductsRaw,
      monthlySalesRaw,
      ordersByStatusRaw,
    ] = await Promise.all([
      this.prisma.order.count(),
      this.prisma.order.count({ where: { createdAt: { gte: startOfMonth } } }),
      this.prisma.order.aggregate({
        where: { status: { in: ['CONFIRMED', 'PROCESSING', 'SHIPPED', 'DELIVERED'] } },
        _sum: { totalAmount: true },
      }),
      this.prisma.order.aggregate({
        where: {
          createdAt: { gte: startOfMonth },
          status: { in: ['CONFIRMED', 'PROCESSING', 'SHIPPED', 'DELIVERED'] },
        },
        _sum: { totalAmount: true },
      }),
      this.prisma.order.aggregate({
        where: {
          createdAt: { gte: startOfLastMonth, lte: endOfLastMonth },
          status: { in: ['CONFIRMED', 'PROCESSING', 'SHIPPED', 'DELIVERED'] },
        },
        _sum: { totalAmount: true },
      }),
      this.prisma.product.count({ where: { isActive: true } }),
      this.prisma.user.count({ where: { role: 'USER' } }),
      this.prisma.order.count({ where: { status: 'PENDING' } }),
      this.prisma.order.findMany({
        take: 10,
        orderBy: { createdAt: 'desc' },
        include: { user: { select: { name: true, avatar: true } } },
      }),
      this.prisma.orderItem.groupBy({
        by: ['productId'],
        _sum: { quantity: true, price: true },
        orderBy: { _sum: { quantity: 'desc' } },
        take: 5,
      }),
      this.prisma.$queryRaw<any[]>`
        SELECT
          DATE_TRUNC('month', "createdAt") AS month,
          COUNT(*)::int AS orders,
          SUM("totalAmount")::float AS revenue
        FROM orders
        WHERE "createdAt" >= NOW() - INTERVAL '6 months'
        AND status IN ('CONFIRMED','PROCESSING','SHIPPED','DELIVERED')
        GROUP BY DATE_TRUNC('month', "createdAt")
        ORDER BY month ASC
      `,
      this.prisma.order.groupBy({
        by: ['status'],
        _count: { _all: true },
      }),
    ]);

    // Enrich top products
    const topProducts = await Promise.all(
      topProductsRaw.map(async (item) => {
        const product = await this.prisma.product.findUnique({
          where: { id: item.productId },
          select: { id: true, name_ru: true, images: { select: { url: true }, take: 1 } },
        });
        return {
          id: item.productId,
          name: product?.name_ru || 'Unknown',
          image: product?.images[0]?.url,
          totalSold: item._sum.quantity || 0,
          revenue: Number(item._sum.price || 0) * (item._sum.quantity || 0),
        };
      }),
    );

    const prevRevenue = Number(lastMonthRevenue._sum.totalAmount ?? 0);
    const currRevenue = Number(monthRevenue._sum.totalAmount ?? 0);

    const revenueGrowth =
      prevRevenue > 0 ? ((currRevenue - prevRevenue) / prevRevenue) * 100 : 0;

    return {
      stats: {
        totalOrders,
        monthRevenue: currRevenue,
        monthRevenueGrowth: Math.round(revenueGrowth * 100) / 100,
        activeUsers: totalUsers,
        pendingOrders,
      },
      revenueChart: monthlySalesRaw.map((s) => ({
        month: new Intl.DateTimeFormat('ru-RU', { month: 'short' }).format(new Date(s.month)),
        revenue: s.revenue,
        orders: s.orders,
      })),
      ordersByStatus: ordersByStatusRaw.map((s) => ({
        status: s.status,
        count: s._count._all,
      })),
      topProducts,
      recentOrders: recentOrders.map((o) => ({
        ...o,
        totalAmount: Number(o.totalAmount),
      })),
    };
  }
}
