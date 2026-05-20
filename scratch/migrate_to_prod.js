const { execSync } = require('child_process');
const fs = require('fs');
const { PrismaClient } = require('@prisma/client');

const localUrl = "postgresql://postgres:postgres@localhost:5432/shoestore";
const prodUrl = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg-a.oregon-postgres.render.com/chocoberry_db";

async function main() {
  console.log('Dumping local data...');
  execSync(`pg_dump "${localUrl}" --schema=public --data-only --column-inserts -E UTF8 -f local_data.sql`, { stdio: 'inherit' });

  console.log('Processing SQL dump...');
  const sql = fs.readFileSync('local_data.sql', 'utf8');
  const lines = sql.split('\n');
  const fixedLines = [];

  for (const line of lines) {
    if (line.includes('INSERT INTO public._prisma_migrations')) continue;
    // Replace public. with shoestore.
    // Be careful to only replace table names, though with --inserts they are formatted safely.
    const fixedLine = line.replace(/INSERT INTO public\./g, 'INSERT INTO shoestore.');
    fixedLines.push(fixedLine);
  }

  fs.writeFileSync('local_data_fixed.sql', fixedLines.join('\n'), 'utf8');
  console.log('Fixed SQL file created.');

  console.log('Truncating production tables...');
  process.env.DATABASE_URL = prodUrl + '?schema=shoestore';
  const prisma = new PrismaClient();
  
  const tables = [
    'users', 'categories', 'brands', 'products', 'banners', 'settings',
    'cart_items', 'likes', 'order_items', 'orders', 'product_colors', 
    'product_images', 'product_sizes', 'reviews', 'refresh_tokens'
  ];
  
  try {
    const truncateQuery = `TRUNCATE ${tables.map(t => `shoestore."${t}"`).join(', ')} CASCADE;`;
    await prisma.$executeRawUnsafe(truncateQuery);
    console.log('Truncation successful.');
  } catch (err) {
    console.error('Error truncating:', err);
  } finally {
    await prisma.$disconnect();
  }

  console.log('Importing data to production...');
  execSync(`psql "${prodUrl}" -f local_data_fixed.sql`, { stdio: 'inherit' });
  console.log('Migration completed successfully!');
}

main().catch(console.error);
