
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const user = await prisma.user.update({
    where: { phone: '+992205686888' },
    data: { role: 'ADMIN' }
  });
  console.log('User promoted to ADMIN:', user.phone);
}

main()
  .catch(e => console.error(e))
  .finally(async () => await prisma.$disconnect());
