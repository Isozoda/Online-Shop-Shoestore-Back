
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  try {
    const data = await prisma.$queryRaw`
      SELECT
        DATE_TRUNC('month', "createdAt") AS month,
        COUNT(*) AS orders,
        SUM("totalAmount") AS revenue
      FROM orders
      WHERE "createdAt" >= NOW() - INTERVAL '6 months'
      AND status IN ('CONFIRMED','PROCESSING','SHIPPED','DELIVERED')
      GROUP BY DATE_TRUNC('month', "createdAt")
      ORDER BY month ASC
    `;
    console.log('Success:', JSON.stringify(data, null, 2));
  } catch (e) {
    console.error('Error with camelCase:', e.message);
    try {
        const data = await prisma.$queryRaw`
          SELECT
            DATE_TRUNC('month', created_at) AS month,
            COUNT(*) AS orders,
            SUM(total_amount) AS revenue
          FROM orders
          WHERE created_at >= NOW() - INTERVAL '6 months'
          AND status IN ('CONFIRMED','PROCESSING','SHIPPED','DELIVERED')
          GROUP BY DATE_TRUNC('month', created_at)
          ORDER BY month ASC
        `;
        console.log('Success with snake_case:', JSON.stringify(data, null, 2));
    } catch (e2) {
        console.error('Error with snake_case:', e2.message);
    }
  }
}

main()
  .catch(e => console.error(e))
  .finally(async () => await prisma.$disconnect());
