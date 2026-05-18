import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

const prisma = new PrismaClient();

async function main() {
  await prisma.user.upsert({
    where: { phone: '+992000000000' },
    update: {},
    create: {
      name: 'Администратор',
      phone: '+992000000000',
      passwordHash: await bcrypt.hash('Admin@123456', 12),
      role: 'ADMIN',
    },
  });

  const categories = await Promise.all([
    prisma.category.upsert({ where: { slug: 'tufliho' }, update: {}, create: { name_tj: 'Туфлиҳо', name_ru: 'Туфли', name_en: 'Heels', slug: 'tufliho' } }),
    prisma.category.upsert({ where: { slug: 'sportivo' }, update: {}, create: { name_tj: 'Спортивӣ', name_ru: 'Спортивная', name_en: 'Sports', slug: 'sportivo' } }),
    prisma.category.upsert({ where: { slug: 'botinkaho' }, update: {}, create: { name_tj: 'Ботинкаҳо', name_ru: 'Ботинки', name_en: 'Boots', slug: 'botinkaho' } }),
    prisma.category.upsert({ where: { slug: 'sandalho' }, update: {}, create: { name_tj: 'Сандалҳо', name_ru: 'Сандалии', name_en: 'Sandals', slug: 'sandalho' } }),
    prisma.category.upsert({ where: { slug: 'mokasinho' }, update: {}, create: { name_tj: 'Мокасинҳо', name_ru: 'Мокасины', name_en: 'Moccasins', slug: 'mokasinho' } }),
  ]);

  const brands = await Promise.all([
    prisma.brand.upsert({ where: { slug: 'nike' }, update: {}, create: { name: 'Nike', slug: 'nike' } }),
    prisma.brand.upsert({ where: { slug: 'adidas' }, update: {}, create: { name: 'Adidas', slug: 'adidas' } }),
    prisma.brand.upsert({ where: { slug: 'puma' }, update: {}, create: { name: 'Puma', slug: 'puma' } }),
    prisma.brand.upsert({ where: { slug: 'zara' }, update: {}, create: { name: 'Zara', slug: 'zara' } }),
  ]);

  const productsData = [
    { name_tj: 'Туфлии классикӣ сурх', name_ru: 'Классические красные туфли', name_en: 'Classic Red Heels', price: 350, discount: 10, category: 0, brand: 3, sku: 'SKU001', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Сурх', name_ru: 'Красный', name_en: 'Red', hexCode: '#FF0000' }] },
    { name_tj: 'Кросовкаи Nike Air', name_ru: 'Кроссовки Nike Air', name_en: 'Nike Air Sneakers', price: 580, discount: 15, category: 1, brand: 0, sku: 'SKU002', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Сафед', name_ru: 'Белый', name_en: 'White', hexCode: '#FFFFFF' }, { name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }] },
    { name_tj: 'Ботинкаи зимистона', name_ru: 'Зимние ботинки', name_en: 'Winter Boots', price: 450, discount: 0, category: 2, brand: 1, sku: 'SKU003', sizes: ['36','37','38','39','40','41'], colors: [{ name_tj: 'Қаҳваранг', name_ru: 'Коричневый', name_en: 'Brown', hexCode: '#8B4513' }] },
    { name_tj: 'Сандали тобистона', name_ru: 'Летние сандалии', name_en: 'Summer Sandals', price: 180, discount: 20, category: 3, brand: 3, sku: 'SKU004', sizes: ['36','37','38'], colors: [{ name_tj: 'Тиллоӣ', name_ru: 'Золотой', name_en: 'Gold', hexCode: '#FFD700' }] },
    { name_tj: 'Мокасини чарм', name_ru: 'Кожаные мокасины', name_en: 'Leather Moccasins', price: 320, discount: 5, category: 4, brand: 3, sku: 'SKU005', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }] },
    { name_tj: 'Кросовкаи Adidas Run', name_ru: 'Кроссовки Adidas Run', name_en: 'Adidas Running', price: 520, discount: 10, category: 1, brand: 1, sku: 'SKU006', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Кабуд', name_ru: 'Синий', name_en: 'Blue', hexCode: '#0000FF' }] },
    { name_tj: 'Пошнабаланд нуқраӣ', name_ru: 'Серебристые каблуки', name_en: 'Silver High Heels', price: 420, discount: 0, category: 0, brand: 3, sku: 'SKU007', sizes: ['36','37','38'], colors: [{ name_tj: 'Нуқраӣ', name_ru: 'Серебристый', name_en: 'Silver', hexCode: '#C0C0C0' }] },
    { name_tj: 'Балеткаи роҳат', name_ru: 'Удобные балетки', name_en: 'Comfort Flats', price: 220, discount: 0, category: 0, brand: 3, sku: 'SKU008', sizes: ['35','36','37','38','39'], colors: [{ name_tj: 'Бежевый', name_ru: 'Бежевый', name_en: 'Beige', hexCode: '#F5F5DC' }] },
    { name_tj: 'Ботинкаи баҳорӣ', name_ru: 'Весенние ботинки', name_en: 'Spring Ankle Boots', price: 380, discount: 12, category: 2, brand: 2, sku: 'SKU009', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Қаҳваранг', name_ru: 'Коричневый', name_en: 'Brown', hexCode: '#8B4513' }, { name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }] },
    { name_tj: 'Кросовкаи Puma Soft', name_ru: 'Кроссовки Puma Soft', name_en: 'Puma Soft Runner', price: 490, discount: 8, category: 1, brand: 2, sku: 'SKU010', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Гулобӣ', name_ru: 'Розовый', name_en: 'Pink', hexCode: '#FFC0CB' }] },
    { name_tj: 'Сандали дарёӣ', name_ru: 'Пляжные сандалии', name_en: 'Beach Sandals', price: 120, discount: 25, category: 3, brand: 3, sku: 'SKU011', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Кабуд', name_ru: 'Голубой', name_en: 'Sky Blue', hexCode: '#87CEEB' }] },
    { name_tj: 'Туфлии расмӣ', name_ru: 'Офисные туфли', name_en: 'Office Heels', price: 395, discount: 0, category: 0, brand: 3, sku: 'SKU012', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Хокистарӣ', name_ru: 'Серый', name_en: 'Grey', hexCode: '#808080' }] },
    { name_tj: 'Снегурочкаи зимистона', name_ru: 'Зимние угги', name_en: 'Winter Uggs', price: 560, discount: 15, category: 2, brand: 3, sku: 'SKU013', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Хокистарӣ', name_ru: 'Серый', name_en: 'Grey', hexCode: '#A0A0A0' }] },
    { name_tj: 'Балеткаи рангоранг', name_ru: 'Яркие балетки', name_en: 'Colorful Flats', price: 195, discount: 0, category: 0, brand: 3, sku: 'SKU014', sizes: ['35','36','37','38'], colors: [{ name_tj: 'Зард', name_ru: 'Желтый', name_en: 'Yellow', hexCode: '#FFFF00' }, { name_tj: 'Сурх', name_ru: 'Красный', name_en: 'Red', hexCode: '#FF0000' }] },
    { name_tj: 'Кросовкаи Nike Free', name_ru: 'Кроссовки Nike Free', name_en: 'Nike Free Run', price: 620, discount: 5, category: 1, brand: 0, sku: 'SKU015', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Кабуди торик', name_ru: 'Темно-синий', name_en: 'Navy', hexCode: '#000080' }] },
    { name_tj: 'Сандали баланд', name_ru: 'Босоножки на каблуке', name_en: 'Heeled Sandals', price: 285, discount: 10, category: 3, brand: 3, sku: 'SKU016', sizes: ['36','37','38'], colors: [{ name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }] },
    { name_tj: 'Мокасини рангаи', name_ru: 'Замшевые мокасины', name_en: 'Suede Moccasins', price: 340, discount: 0, category: 4, brand: 3, sku: 'SKU017', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Кабуд', name_ru: 'Синий', name_en: 'Blue', hexCode: '#4169E1' }] },
    { name_tj: 'Ботинкаи чарм', name_ru: 'Кожаные ботинки', name_en: 'Leather Chelsea Boots', price: 520, discount: 0, category: 2, brand: 1, sku: 'SKU018', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }] },
    { name_tj: 'Кросовкаи Adidas Stan', name_ru: 'Adidas Stan Smith', name_en: 'Adidas Stan Smith', price: 480, discount: 0, category: 1, brand: 1, sku: 'SKU019', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Сафед', name_ru: 'Белый', name_en: 'White', hexCode: '#FFFFFF' }] },
    { name_tj: 'Туфлии шаб', name_ru: 'Вечерние туфли', name_en: 'Evening Heels', price: 460, discount: 20, category: 0, brand: 3, sku: 'SKU020', sizes: ['36','37','38'], colors: [{ name_tj: 'Сиёҳ', name_ru: 'Черный', name_en: 'Black', hexCode: '#000000' }, { name_tj: 'Тиллоӣ', name_ru: 'Золотой', name_en: 'Gold', hexCode: '#FFD700' }] },
    { name_tj: 'Балеткаи чарм', name_ru: 'Кожаные балетки', name_en: 'Leather Ballerinas', price: 265, discount: 0, category: 0, brand: 3, sku: 'SKU021', sizes: ['35','36','37','38','39'], colors: [{ name_tj: 'Гулобӣ', name_ru: 'Розовый', name_en: 'Pink', hexCode: '#FFB6C1' }] },
    { name_tj: 'Кросовкаи Puma Suede', name_ru: 'Puma Suede Classic', name_en: 'Puma Suede Classic', price: 440, discount: 10, category: 1, brand: 2, sku: 'SKU022', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Сурх', name_ru: 'Красный', name_en: 'Red', hexCode: '#DC143C' }] },
    { name_tj: 'Сандали ҷавоҳиротдор', name_ru: 'Сандалии с украшениями', name_en: 'Embellished Sandals', price: 310, discount: 15, category: 3, brand: 3, sku: 'SKU023', sizes: ['36','37','38'], colors: [{ name_tj: 'Тиллоӣ', name_ru: 'Золотой', name_en: 'Gold', hexCode: '#FFD700' }] },
    { name_tj: 'Ботинкаи аскарӣ', name_ru: 'Ботинки в стиле милитари', name_en: 'Military Style Boots', price: 480, discount: 0, category: 2, brand: 3, sku: 'SKU024', sizes: ['36','37','38','39','40'], colors: [{ name_tj: 'Зайтун', name_ru: 'Оливковый', name_en: 'Olive', hexCode: '#808000' }] },
    { name_tj: 'Мокасини спортивӣ', name_ru: 'Спортивные мокасины', name_en: 'Sport Moccasins', price: 290, discount: 5, category: 4, brand: 2, sku: 'SKU025', sizes: ['36','37','38','39'], colors: [{ name_tj: 'Хокистарӣ', name_ru: 'Серый', name_en: 'Grey', hexCode: '#696969' }] },
  ];

  for (const p of productsData) {
    const finalPrice = p.price * (1 - p.discount / 100);
    const slug = p.sku.toLowerCase() + '-' + p.name_en.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');

    await prisma.product.upsert({
      where: { sku: p.sku },
      update: {},
      create: {
        name_tj: p.name_tj,
        name_ru: p.name_ru,
        name_en: p.name_en,
        slug,
        sku: p.sku,
        price: p.price,
        discountPercent: p.discount,
        finalPrice,
        stock: Math.floor(Math.random() * 50) + 10,
        isFeatured: Math.random() > 0.6,
        categoryId: categories[p.category].id,
        brandId: brands[p.brand].id,
        description_tj: `${p.name_tj} — сифати баланд, нархи муносиб`,
        description_ru: `${p.name_ru} — высокое качество, доступная цена`,
        description_en: `${p.name_en} — high quality at affordable price`,
        sizes: {
          create: p.sizes.map((s) => ({
            size: s,
            stock: Math.floor(Math.random() * 15) + 5,
          })),
        },
        colors: { create: p.colors },
        images: {
          create: [{ url: `/uploads/placeholder-${p.sku}.jpg`, isMain: true, order: 0 }],
        },
      },
    });
  }

  console.log('✅ Seed муваффақона иҷро шуд — 25 маҳсулот илова карда шуд');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
