const { PrismaClient } = require('@prisma/client');

// Query default schema (public)
process.env.DATABASE_URL = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg-a.oregon-postgres.render.com/chocoberry_db";

const prisma = new PrismaClient();

async function main() {
  try {
    const productCount = await prisma.product.count();
    const userCount = await prisma.user.count();
    console.log(`Connection successful to public schema!`);
    console.log(`Product count in public schema: ${productCount}`);
    console.log(`User count in public schema: ${userCount}`);
  } catch (err) {
    console.log(`Could not connect to public schema tables (they probably don't exist or schema differs):`, err.message);
  }
}

main()
  .catch(e => console.error("Fatal error:", e))
  .finally(async () => await prisma.$disconnect());
