const { PrismaClient } = require('@prisma/client');
process.env.DATABASE_URL = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg-a.oregon-postgres.render.com/chocoberry_db?schema=shoestore";

const prisma = new PrismaClient();

async function main() {
  const products = await prisma.product.findMany({ take: 2 });
  console.log("Sample products:", JSON.stringify(products, null, 2));
}

main().catch(console.error).finally(() => prisma.$disconnect());
