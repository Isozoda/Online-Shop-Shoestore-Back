const { PrismaClient } = require('@prisma/client');
process.env.DATABASE_URL = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg-a.oregon-postgres.render.com/chocoberry_db?schema=shoestore";

const prisma = new PrismaClient();

async function main() {
  const products = await prisma.product.findMany({
    include: { images: true }
  });
  let count = 0;
  for (const product of products) {
    if (product.images && product.images.length > 0) {
      await prisma.productImage.update({
        where: { id: product.images[0].id },
        data: { url: `/uploads/placeholder-${product.sku}.jpg` }
      });
      count++;
    }
  }
  console.log(`Reverted ${count} images back to local URLs!`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
