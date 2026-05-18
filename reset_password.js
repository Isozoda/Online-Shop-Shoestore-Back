
const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcrypt');
const prisma = new PrismaClient();

async function main() {
  const passwordHash = await bcrypt.hash('123456', 12);
  const user = await prisma.user.update({
    where: { phone: '+992205686888' },
    data: { passwordHash }
  });
  console.log('Password updated for:', user.phone);
}

main()
  .catch(e => console.error(e))
  .finally(async () => await prisma.$disconnect());
