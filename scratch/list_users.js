const { PrismaClient } = require('@prisma/client');

process.env.DATABASE_URL = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg.oregon-postgres.render.com/chocoberry_db?schema=shoestore&sslmode=require";

const prisma = new PrismaClient();

async function main() {
  const users = await prisma.user.findMany({
    select: {
      id: true,
      name: true,
      phone: true,
      role: true,
      createdAt: true
    }
  });
  console.log("USERS IN DB:", JSON.stringify(users, null, 2));
}

main()
  .catch(e => console.error(e))
  .finally(async () => await prisma.$disconnect());
