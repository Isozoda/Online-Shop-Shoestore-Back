const { PrismaClient } = require('@prisma/client');

process.env.DATABASE_URL = "postgresql://chocoberry_db_user:wiRzBT3GiP9SEh5zMBa4jXiwl9nbb78F@dpg-d7vn6enaqgkc739ei0fg-a.oregon-postgres.render.com/chocoberry_db?schema=shoestore";

const prisma = new PrismaClient();

async function main() {
  console.log("Connected using Prisma!");

  // List all schemas
  const schemas = await prisma.$queryRawUnsafe(`
    SELECT schema_name FROM information_schema.schemata 
    WHERE schema_name NOT IN ('information_schema', 'pg_catalog')
  `);
  console.log("Schemas:", schemas.map(r => r.schema_name));

  // List all tables
  const tables = await prisma.$queryRawUnsafe(`
    SELECT table_schema, table_name 
    FROM information_schema.tables 
    WHERE table_schema NOT IN ('information_schema', 'pg_catalog')
    ORDER BY table_schema, table_name
  `);
  
  console.log("Tables and row counts:");
  for (const row of tables) {
    try {
      const countRes = await prisma.$queryRawUnsafe(`SELECT COUNT(*)::text as count FROM "${row.table_schema}"."${row.table_name}"`);
      console.log(`- ${row.table_schema}.${row.table_name}: ${countRes[0].count} rows`);
    } catch (e) {
      console.log(`- ${row.table_schema}.${row.table_name}: error reading (${e.message})`);
    }
  }
}

main()
  .catch(console.error)
  .finally(async () => await prisma.$disconnect());
