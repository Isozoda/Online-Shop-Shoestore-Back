import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

const prisma = new PrismaClient();

async function main() {
  // 1. Get or create test users
  const user1 = await prisma.user.upsert({
    where: { phone: '+992918111111' },
    update: {},
    create: {
      name: 'Мафтуна Раҳимова',
      phone: '+992918111111',
      passwordHash: await bcrypt.hash('User@123456', 12),
      avatar: '/uploads/user1.jpg',
      role: 'USER',
    },
  });

  const user2 = await prisma.user.upsert({
    where: { phone: '+992927222222' },
    update: {},
    create: {
      name: 'Фарзона Шарипова',
      phone: '+992927222222',
      passwordHash: await bcrypt.hash('User@123456', 12),
      avatar: '/uploads/user2.jpg',
      role: 'USER',
    },
  });

  const user3 = await prisma.user.upsert({
    where: { phone: '+992935333333' },
    update: {},
    create: {
      name: 'Ситора Саидова',
      phone: '+992935333333',
      passwordHash: await bcrypt.hash('User@123456', 12),
      avatar: '/uploads/user3.jpg',
      role: 'USER',
    },
  });

  // 2. Find some products
  const products = await prisma.product.findMany({ take: 3 });
  if (products.length < 3) {
    console.error('❌ Please seed products first using `npx prisma db seed`');
    return;
  }

  // 3. Create reviews
  await prisma.review.upsert({
    where: { userId_productId: { userId: user1.id, productId: products[0].id } },
    update: { status: 'PENDING' },
    create: {
      userId: user1.id,
      productId: products[0].id,
      rating: 5,
      comment: 'Ин туфлиҳо хеле зебо ва бароҳат ҳастанд! Тавсия медиҳам.',
      status: 'PENDING',
    },
  });

  await prisma.review.upsert({
    where: { userId_productId: { userId: user2.id, productId: products[1].id } },
    update: { status: 'APPROVED' },
    create: {
      userId: user2.id,
      productId: products[1].id,
      rating: 4,
      comment: 'Сифаташ хуб аст, андозааш рост омад. Каме дертар оварданд.',
      status: 'APPROVED',
    },
  });

  await prisma.review.upsert({
    where: { userId_productId: { userId: user3.id, productId: products[2].id } },
    update: { status: 'REJECTED' },
    create: {
      userId: user3.id,
      productId: products[2].id,
      rating: 2,
      comment: 'Рангаш ба акс мувофиқат намекунад ва бӯи нохуш дорад.',
      status: 'REJECTED',
    },
  });

  console.log('✅ Mock reviews seeded successfully!');
}

main()
  .catch((e) => console.error(e))
  .finally(() => prisma.$disconnect());
