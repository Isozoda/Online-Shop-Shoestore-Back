--
-- PostgreSQL database dump
--

\restrict 5PcNRoeZY4ukLWY6GKjaMEMsKWlYtCsYxEdphUI8TpDbZwv9Lc5Lpl5fioRhJME

-- Dumped from database version 16.13
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('32800e65-551e-4275-ba35-a8544a940ae9', 'df96753f52bb3ab1bb3e46115754a41eee70a06395d405683fb6226b68698f9d', '2026-05-13 19:50:51.628496+05', '20260513145051_init', NULL, NULL, '2026-05-13 19:50:51.121213+05', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('e82f7f62-926d-49fd-8d9b-0348018942b2', '3bdfa81ec082c08e79f7f6cd875a4a822443b1282cce11f9bff373381cec8319', '2026-05-16 15:21:48.053487+05', '20260516102147_add_banner_button_text', NULL, NULL, '2026-05-16 15:21:48.01882+05', 1);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands (id, name, slug, logo, "createdAt", "updatedAt") VALUES ('defc69d8-fd97-488b-96be-af103006e7a2', 'Puma', 'puma', '/uploads/general/9ed58985-7eca-424e-b37a-8e5fbdcd7aed.webp', '2026-05-13 14:50:55.704', '2026-05-15 17:33:12.668');
INSERT INTO public.brands (id, name, slug, logo, "createdAt", "updatedAt") VALUES ('a98faf20-ca4b-4332-a9c1-9081240a9b27', 'Adidas', 'adidas', '/uploads/general/32c880de-649a-4494-9b4f-42ffdfc0641f.webp', '2026-05-13 14:50:55.704', '2026-05-15 17:32:44.865');
INSERT INTO public.brands (id, name, slug, logo, "createdAt", "updatedAt") VALUES ('8ee0af42-c73d-4fd8-9285-486e17796773', 'Nike', 'nike', '/uploads/general/a8e82174-782e-4e91-84dd-c1314795bc84.webp', '2026-05-13 14:50:55.704', '2026-05-15 17:33:03.354');
INSERT INTO public.brands (id, name, slug, logo, "createdAt", "updatedAt") VALUES ('bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', 'Zara', 'zara', '/uploads/general/26c8f5b5-221a-4ae1-bb4f-69bab25e6ab8.webp', '2026-05-13 14:50:55.704', '2026-05-15 17:33:32.035');


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name_tj, name_ru, name_en, slug, image, "parentId", "createdAt", "updatedAt") VALUES ('262cdc03-cdda-435b-bcff-492d80052b77', 'Туфлиҳо', 'Туфли', 'Heels', 'tufliho', NULL, NULL, '2026-05-13 14:50:55.612', '2026-05-13 14:50:55.612');
INSERT INTO public.categories (id, name_tj, name_ru, name_en, slug, image, "parentId", "createdAt", "updatedAt") VALUES ('4b7e6a7b-8c05-456c-9f23-e1d8f096485c', 'Спортивӣ', 'Спортивная', 'Sports', 'sportivo', NULL, NULL, '2026-05-13 14:50:55.612', '2026-05-13 14:50:55.612');
INSERT INTO public.categories (id, name_tj, name_ru, name_en, slug, image, "parentId", "createdAt", "updatedAt") VALUES ('33fad80f-cc41-4576-863c-240db983068a', 'Сандалҳо', 'Сандалии', 'Sandals', 'sandalho', NULL, NULL, '2026-05-13 14:50:55.613', '2026-05-13 14:50:55.613');
INSERT INTO public.categories (id, name_tj, name_ru, name_en, slug, image, "parentId", "createdAt", "updatedAt") VALUES ('d2751f05-feb0-49f5-b8f1-4cee21129f0d', 'Ботинкаҳо', 'Ботинки', 'Boots', 'botinkaho', '/uploads/general/5566bffd-c51f-4e6d-84d6-eaf98972b11a.webp', '262cdc03-cdda-435b-bcff-492d80052b77', '2026-05-13 14:50:55.612', '2026-05-18 08:47:46.531');
INSERT INTO public.categories (id, name_tj, name_ru, name_en, slug, image, "parentId", "createdAt", "updatedAt") VALUES ('35fad777-8f21-4097-b195-8cfe5c52c624', 'Мокасинҳо', 'Мокасины', 'Moccasins', 'mokasinho', '/uploads/general/0c0d193d-eb25-46cb-b316-6bd932c1840b.webp', NULL, '2026-05-13 14:50:55.613', '2026-05-18 08:48:30.802');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('080ec70e-8991-43dd-a165-e8aa4d96129a', 'Туфлии классикӣ сурх', 'Классические красные туфли', 'Classic Red Heels', 'sku001-classic-red-heels', 'Туфлии классикӣ сурх — сифати баланд, нархи муносиб', 'Классические красные туфли — высокое качество, доступная цена', 'Classic Red Heels — high quality at affordable price', 350.00, 10, 315.00, 'SKU001', 15, true, false, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.714', '2026-05-13 14:50:55.714');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('3d252d8b-a737-4c7e-a8e0-c225b9092f8e', 'Кросовкаи Nike Air', 'Кроссовки Nike Air', 'Nike Air Sneakers', 'sku002-nike-air-sneakers', 'Кросовкаи Nike Air — сифати баланд, нархи муносиб', 'Кроссовки Nike Air — высокое качество, доступная цена', 'Nike Air Sneakers — high quality at affordable price', 580.00, 15, 493.00, 'SKU002', 35, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', '8ee0af42-c73d-4fd8-9285-486e17796773', '2026-05-13 14:50:55.735', '2026-05-13 14:50:55.735');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('ec0789df-5a3b-42c9-a7f2-afa7d3076091', 'Ботинкаи зимистона', 'Зимние ботинки', 'Winter Boots', 'sku003-winter-boots', 'Ботинкаи зимистона — сифати баланд, нархи муносиб', 'Зимние ботинки — высокое качество, доступная цена', 'Winter Boots — high quality at affordable price', 450.00, 0, 450.00, 'SKU003', 47, true, false, 'd2751f05-feb0-49f5-b8f1-4cee21129f0d', 'a98faf20-ca4b-4332-a9c1-9081240a9b27', '2026-05-13 14:50:55.743', '2026-05-13 14:50:55.743');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5', 'Сандали тобистона', 'Летние сандалии', 'Summer Sandals', 'sku004-summer-sandals', 'Сандали тобистона — сифати баланд, нархи муносиб', 'Летние сандалии — высокое качество, доступная цена', 'Summer Sandals — high quality at affordable price', 180.00, 20, 144.00, 'SKU004', 55, true, true, '33fad80f-cc41-4576-863c-240db983068a', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.749', '2026-05-13 14:50:55.749');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('38f5fc58-95df-4f6b-a502-dd1420977a25', 'Мокасини чарм', 'Кожаные мокасины', 'Leather Moccasins', 'sku005-leather-moccasins', 'Мокасини чарм — сифати баланд, нархи муносиб', 'Кожаные мокасины — высокое качество, доступная цена', 'Leather Moccasins — high quality at affordable price', 320.00, 5, 304.00, 'SKU005', 58, true, true, '35fad777-8f21-4097-b195-8cfe5c52c624', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.757', '2026-05-13 14:50:55.757');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('f6780e09-21ee-45a9-b735-5796511b64ce', 'Кросовкаи Adidas Run', 'Кроссовки Adidas Run', 'Adidas Running', 'sku006-adidas-running', 'Кросовкаи Adidas Run — сифати баланд, нархи муносиб', 'Кроссовки Adidas Run — высокое качество, доступная цена', 'Adidas Running — high quality at affordable price', 520.00, 10, 468.00, 'SKU006', 28, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', 'a98faf20-ca4b-4332-a9c1-9081240a9b27', '2026-05-13 14:50:55.79', '2026-05-13 14:50:55.79');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('8fe8403d-ae08-497f-b02b-733d148e0095', 'Пошнабаланд нуқраӣ', 'Серебристые каблуки', 'Silver High Heels', 'sku007-silver-high-heels', 'Пошнабаланд нуқраӣ — сифати баланд, нархи муносиб', 'Серебристые каблуки — высокое качество, доступная цена', 'Silver High Heels — high quality at affordable price', 420.00, 0, 420.00, 'SKU007', 28, true, false, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.799', '2026-05-13 14:50:55.799');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('bc26cb99-e450-4935-b187-487dea1e802e', 'Балеткаи роҳат', 'Удобные балетки', 'Comfort Flats', 'sku008-comfort-flats', 'Балеткаи роҳат — сифати баланд, нархи муносиб', 'Удобные балетки — высокое качество, доступная цена', 'Comfort Flats — high quality at affordable price', 220.00, 0, 220.00, 'SKU008', 39, true, true, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.81', '2026-05-13 14:50:55.81');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('523d9559-d612-4214-9c87-d2e969e8216c', 'Ботинкаи баҳорӣ', 'Весенние ботинки', 'Spring Ankle Boots', 'sku009-spring-ankle-boots', 'Ботинкаи баҳорӣ — сифати баланд, нархи муносиб', 'Весенние ботинки — высокое качество, доступная цена', 'Spring Ankle Boots — high quality at affordable price', 380.00, 12, 334.40, 'SKU009', 53, true, true, 'd2751f05-feb0-49f5-b8f1-4cee21129f0d', 'defc69d8-fd97-488b-96be-af103006e7a2', '2026-05-13 14:50:55.818', '2026-05-13 14:50:55.818');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('554aeb3d-1533-4be0-9ebf-48f9d9578b7f', 'Кросовкаи Puma Soft', 'Кроссовки Puma Soft', 'Puma Soft Runner', 'sku010-puma-soft-runner', 'Кросовкаи Puma Soft — сифати баланд, нархи муносиб', 'Кроссовки Puma Soft — высокое качество, доступная цена', 'Puma Soft Runner — high quality at affordable price', 490.00, 8, 450.80, 'SKU010', 26, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', 'defc69d8-fd97-488b-96be-af103006e7a2', '2026-05-13 14:50:55.827', '2026-05-13 14:50:55.827');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('19591afd-cab7-4ac9-a4d3-eee063f9a754', 'Сандали дарёӣ', 'Пляжные сандалии', 'Beach Sandals', 'sku011-beach-sandals', 'Сандали дарёӣ — сифати баланд, нархи муносиб', 'Пляжные сандалии — высокое качество, доступная цена', 'Beach Sandals — high quality at affordable price', 120.00, 25, 90.00, 'SKU011', 24, true, true, '33fad80f-cc41-4576-863c-240db983068a', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.834', '2026-05-13 14:50:55.834');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('2c963f7a-882d-444a-98e3-5a3bb4b0dc22', 'Туфлии расмӣ', 'Офисные туфли', 'Office Heels', 'sku012-office-heels', 'Туфлии расмӣ — сифати баланд, нархи муносиб', 'Офисные туфли — высокое качество, доступная цена', 'Office Heels — high quality at affordable price', 395.00, 0, 395.00, 'SKU012', 17, true, false, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.842', '2026-05-13 14:50:55.842');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('31298554-fae7-4e5e-85ef-17de643d6498', 'Снегурочкаи зимистона', 'Зимние угги', 'Winter Uggs', 'sku013-winter-uggs', 'Снегурочкаи зимистона — сифати баланд, нархи муносиб', 'Зимние угги — высокое качество, доступная цена', 'Winter Uggs — high quality at affordable price', 560.00, 15, 476.00, 'SKU013', 44, true, false, 'd2751f05-feb0-49f5-b8f1-4cee21129f0d', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.85', '2026-05-13 14:50:55.85');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('c4e4a5cf-36d1-4615-8844-b5059d1fde60', 'Балеткаи рангоранг', 'Яркие балетки', 'Colorful Flats', 'sku014-colorful-flats', 'Балеткаи рангоранг — сифати баланд, нархи муносиб', 'Яркие балетки — высокое качество, доступная цена', 'Colorful Flats — high quality at affordable price', 195.00, 0, 195.00, 'SKU014', 54, true, false, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.859', '2026-05-13 14:50:55.859');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('63c19b79-d609-41ef-b504-8e89e571b974', 'Кросовкаи Nike Free', 'Кроссовки Nike Free', 'Nike Free Run', 'sku015-nike-free-run', 'Кросовкаи Nike Free — сифати баланд, нархи муносиб', 'Кроссовки Nike Free — высокое качество, доступная цена', 'Nike Free Run — high quality at affordable price', 620.00, 5, 589.00, 'SKU015', 27, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', '8ee0af42-c73d-4fd8-9285-486e17796773', '2026-05-13 14:50:55.868', '2026-05-13 14:50:55.868');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('32d6262b-5697-4858-8ec7-532b9b7bb667', 'Сандали баланд', 'Босоножки на каблуке', 'Heeled Sandals', 'sku016-heeled-sandals', 'Сандали баланд — сифати баланд, нархи муносиб', 'Босоножки на каблуке — высокое качество, доступная цена', 'Heeled Sandals — high quality at affordable price', 285.00, 10, 256.50, 'SKU016', 32, true, false, '33fad80f-cc41-4576-863c-240db983068a', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.876', '2026-05-13 14:50:55.876');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('b89280c9-55e1-430d-9a85-cc6d6fb2738a', 'Мокасини рангаи', 'Замшевые мокасины', 'Suede Moccasins', 'sku017-suede-moccasins', 'Мокасини рангаи — сифати баланд, нархи муносиб', 'Замшевые мокасины — высокое качество, доступная цена', 'Suede Moccasins — high quality at affordable price', 340.00, 0, 340.00, 'SKU017', 57, true, false, '35fad777-8f21-4097-b195-8cfe5c52c624', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.884', '2026-05-13 14:50:55.884');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc', 'Ботинкаи чарм', 'Кожаные ботинки', 'Leather Chelsea Boots', 'sku018-leather-chelsea-boots', 'Ботинкаи чарм — сифати баланд, нархи муносиб', 'Кожаные ботинки — высокое качество, доступная цена', 'Leather Chelsea Boots — high quality at affordable price', 520.00, 0, 520.00, 'SKU018', 16, true, false, 'd2751f05-feb0-49f5-b8f1-4cee21129f0d', 'a98faf20-ca4b-4332-a9c1-9081240a9b27', '2026-05-13 14:50:55.895', '2026-05-13 14:50:55.895');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('b6e4ba93-2e88-46e5-93fc-fe3cffff876b', 'Кросовкаи Adidas Stan', 'Adidas Stan Smith', 'Adidas Stan Smith', 'sku019-adidas-stan-smith', 'Кросовкаи Adidas Stan — сифати баланд, нархи муносиб', 'Adidas Stan Smith — высокое качество, доступная цена', 'Adidas Stan Smith — high quality at affordable price', 480.00, 0, 480.00, 'SKU019', 22, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', 'a98faf20-ca4b-4332-a9c1-9081240a9b27', '2026-05-13 14:50:55.9', '2026-05-13 14:50:55.9');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('6c82d245-1804-4f30-87b8-1f3051a3ce6f', 'Туфлии шаб', 'Вечерние туфли', 'Evening Heels', 'sku020-evening-heels', 'Туфлии шаб — сифати баланд, нархи муносиб', 'Вечерние туфли — высокое качество, доступная цена', 'Evening Heels — high quality at affordable price', 460.00, 20, 368.00, 'SKU020', 33, true, true, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.908', '2026-05-13 14:50:55.908');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('d495019c-802f-4844-a72f-5a3a0859136e', 'Балеткаи чарм', 'Кожаные балетки', 'Leather Ballerinas', 'sku021-leather-ballerinas', 'Балеткаи чарм — сифати баланд, нархи муносиб', 'Кожаные балетки — высокое качество, доступная цена', 'Leather Ballerinas — high quality at affordable price', 265.00, 0, 265.00, 'SKU021', 59, true, true, '262cdc03-cdda-435b-bcff-492d80052b77', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.914', '2026-05-13 14:50:55.914');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('78dd00d2-78ff-468a-a8b7-d1ae14551d43', 'Кросовкаи Puma Suede', 'Puma Suede Classic', 'Puma Suede Classic', 'sku022-puma-suede-classic', 'Кросовкаи Puma Suede — сифати баланд, нархи муносиб', 'Puma Suede Classic — высокое качество, доступная цена', 'Puma Suede Classic — high quality at affordable price', 440.00, 10, 396.00, 'SKU022', 54, true, true, '4b7e6a7b-8c05-456c-9f23-e1d8f096485c', 'defc69d8-fd97-488b-96be-af103006e7a2', '2026-05-13 14:50:55.919', '2026-05-13 14:50:55.919');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('b2c9f5fe-cbd0-4577-8264-25edd712fc15', 'Сандали ҷавоҳиротдор', 'Сандалии с украшениями', 'Embellished Sandals', 'sku023-embellished-sandals', 'Сандали ҷавоҳиротдор — сифати баланд, нархи муносиб', 'Сандалии с украшениями — высокое качество, доступная цена', 'Embellished Sandals — high quality at affordable price', 310.00, 15, 263.50, 'SKU023', 29, true, false, '33fad80f-cc41-4576-863c-240db983068a', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.925', '2026-05-13 14:50:55.925');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('32309873-790b-471f-ad29-52a9add7a5be', 'Ботинкаи аскарӣ', 'Ботинки в стиле милитари', 'Military Style Boots', 'sku024-military-style-boots', 'Ботинкаи аскарӣ — сифати баланд, нархи муносиб', 'Ботинки в стиле милитари — высокое качество, доступная цена', 'Military Style Boots — high quality at affordable price', 480.00, 0, 480.00, 'SKU024', 51, true, false, 'd2751f05-feb0-49f5-b8f1-4cee21129f0d', 'bd0b2e0f-9635-4ec9-9cc5-fc4efc8299db', '2026-05-13 14:50:55.931', '2026-05-13 14:50:55.931');
INSERT INTO public.products (id, name_tj, name_ru, name_en, slug, description_tj, description_ru, description_en, price, "discountPercent", "finalPrice", sku, stock, "isActive", "isFeatured", "categoryId", "brandId", "createdAt", "updatedAt") VALUES ('d208a378-fd10-4521-aad1-efdb1d7c798c', 'Мокасини спортивӣ', 'Спортивные мокасины', 'Sport Moccasins', 'sku025-sport-moccasins', 'Мокасини спортивӣ — сифати баланд, нархи муносиб', 'Спортивные мокасины — высокое качество, доступная цена', 'Sport Moccasins — high quality at affordable price', 290.00, 5, 275.50, 'SKU025', 32, true, false, '35fad777-8f21-4097-b195-8cfe5c52c624', 'defc69d8-fd97-488b-96be-af103006e7a2', '2026-05-13 14:50:55.937', '2026-05-15 15:14:17.325');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, phone, email, "passwordHash", avatar, role, "telegramId", "createdAt", "updatedAt") VALUES ('a89f7abf-e855-4004-9124-d75851bb3629', 'Iso Musoev', '+992205686888', NULL, '$2b$12$FOftnWgitdGAf7lEEhCbbev7Xo/lxpRsQnYr1HP1.eiUhfY/3GBYC', '/uploads/avatars/4527bc6b-a176-45a5-95a7-d3f14ebac2e0.webp', 'ADMIN', NULL, '2026-05-15 03:01:55.886', '2026-05-15 13:42:18.744');
INSERT INTO public.users (id, name, phone, email, "passwordHash", avatar, role, "telegramId", "createdAt", "updatedAt") VALUES ('5bcff760-68b2-41f5-8097-8b2872b6a084', 'Iso Musoev', '+992901048186', NULL, '$2b$12$0hwHPCC8EKhMVB3wLy2aD.lW7rRPFFQUbI8EtneWEot1XcnRX9XDu', '/uploads/avatars/e177567f-e5b4-4545-9c8b-ab36fdb7ccbd.webp', 'USER', NULL, '2026-05-14 08:38:00.582', '2026-05-19 09:51:12.503');
INSERT INTO public.users (id, name, phone, email, "passwordHash", avatar, role, "telegramId", "createdAt", "updatedAt") VALUES ('920c9ac6-6d58-4d9d-990b-1b09af6f876a', 'Администратор', '+992000000000', NULL, '$2b$12$Fgbe3rpzVtfsKTgUdlqM/u5Tih2v7mNSEsttgYl3TcUpFArnCD2Fq', NULL, 'ADMIN', NULL, '2026-05-13 14:50:55.584', '2026-05-19 09:57:40.778');


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('a1f7b9ee-8918-4051-9298-773496f3fc05', 'ORD-1778754684162-493', 'PENDING', 458.00, 'WHATSAPP', 'Iso Musoev', '+992 205686884', 'A. Navoi 35/40', 'salom ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 10:31:24.174', '2026-05-14 10:31:24.174');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('12bc1bfb-b12c-476a-a6a6-64a36a658a14', 'ORD-1778754907479-613', 'PENDING', 589.00, 'TELEGRAM', 'Iso Musoev', '205686884', 'A. Navoi 35/40', 'musob ajeylwiea', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 10:35:07.481', '2026-05-14 10:35:07.481');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('bc4090f0-c266-4c40-94c2-687eb57d658a', 'ORD-1778756805627-26', 'PENDING', 270.00, 'TELEGRAM', 'Iso Musoev', '200008007', 'A. Navoi 35/40', 'cfhgjkl', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 11:06:45.63', '2026-05-14 11:06:45.63');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('10aef994-ef3e-4d98-8dcb-8dc79b2c84c0', 'ORD-1778756871455-741', 'PENDING', 90.00, 'WHATSAPP', 'Iso Musoev', '200008007', 'A. Navoi 35/40', 'using ahegja sta', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 11:07:51.457', '2026-05-14 11:07:51.457');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('6eea491f-dd89-4b4c-a0cb-c1a775b30aa4', 'ORD-1778756961198-615', 'PENDING', 265.00, 'WHATSAPP', 'Iso Musoev', '205686884', 'A. Navoi 35/40', 'salom baroi man biyored dar muhlati nachandon kutoh ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 11:09:21.2', '2026-05-14 11:09:21.2');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('f243fc4e-b291-428d-8bfa-52923315c354', 'ORD-1778757225233-737', 'PENDING', 795.00, 'TELEGRAM', 'Iso Musoev', '205686884', 'A. Navoi 35/40', 'alo shumo chi khel hasted ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 11:13:45.234', '2026-05-14 11:13:45.234');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('8edaf29b-97e0-448d-97eb-e69db5a07dcf', 'ORD-1778767237984-170', 'PENDING', 265.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'Salom nominb kwermwefgler', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:00:37.988', '2026-05-14 14:00:37.988');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('89607220-9178-444a-9619-3b3e4cc13bf8', 'ORD-1778767602663-301', 'PENDING', 792.00, 'TELEGRAM', 'Iso Musoev', '+992205686884', 'A. Navoi 35/40', 'salom asalcha
', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:06:42.667', '2026-05-14 14:06:42.667');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('7d94f98f-7189-4090-83e2-df88eaf8d298', 'ORD-1778768442281-168', 'PENDING', 396.00, 'WHATSAPP', 'Behzot Nosirov', '+992205686884', 'A. Navoi 35/40', 'aalllo behzot chi shid iyo chiyan ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:20:42.288', '2026-05-14 14:20:42.288');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('6e2706e4-6df5-4dd9-9d89-fd1094aa5a23', 'ORD-1778768786748-597', 'PENDING', 368.00, 'TELEGRAM', 'Iso Musoev', '+992205686884', 'A. Navoi 35/40', 'alo test', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:26:26.756', '2026-05-14 14:26:26.756');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('a32e08ed-93f0-409b-a2a0-debdd7dc4818', 'ORD-1778769006932-129', 'PENDING', 396.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'salom ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:30:06.935', '2026-05-14 14:30:06.935');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('75f4d363-c0d1-4671-a2f0-5ee9adf73be3', 'ORD-1778769318474-298', 'PENDING', 265.00, 'TELEGRAM', 'Iso Musoev', '+992205686884', 'A. Navoi 35/40', 'az kujoed shumo test !!!', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:35:18.516', '2026-05-14 14:35:18.516');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('6c394a77-852f-48a7-ac7d-5867725b15cc', 'ORD-1778772909751-836', 'PENDING', 3312.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'test', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 15:35:09.757', '2026-05-14 15:35:09.757');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('f84f433d-241f-45f4-9ad5-8670f659b0ac', 'ORD-1778773065136-607', 'PENDING', 668.80, 'WHATSAPP', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'test', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 15:37:45.141', '2026-05-14 15:37:45.141');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('ff894a7f-88df-4a20-ae02-c79899041bc2', 'ORD-1778775230235-138', 'PENDING', 368.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'test', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 16:13:50.237', '2026-05-14 16:13:50.237');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('f3ae8d41-ef79-4c3a-a30e-5f97927482cf', 'ORD-1778813678613-730', 'PENDING', 792.00, 'WHATSAPP', 'Usmonov Abdullo', '+992200008007', 'A. Navoi 35/40', 'oihterf ool9ruh', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-15 02:54:38.618', '2026-05-15 02:54:38.618');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('e7825ffa-425c-4f37-bb5b-5bd55375b255', 'ORD-1778821907787-451', 'PENDING', 1406.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'hb2rewhj h', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-15 05:11:47.794', '2026-05-15 05:11:47.794');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('2a514199-897e-4c16-bc80-feb8b0be33b6', 'ORD-1778824723122-544', 'PENDING', 180.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'vkbn,m.', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-15 05:58:43.124', '2026-05-15 05:58:43.124');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('5773347b-f5ae-4f2f-840a-c1868f47c580', 'ORD-1778852572198-157', 'DELIVERED', 1244.00, 'TELEGRAM', 'Iso Musoev', '+992205686884', 'A. Navoi 35/40', 'bisyor ur va harchi zuddtar oyad khubtar ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-15 13:42:52.201', '2026-05-15 14:07:07.815');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('2b3d1397-5fd3-4a9b-b8a8-95dc6ef13ea7', 'ORD-1778769358228-816', 'SHIPPED', 265.00, 'TELEGRAM', 'Iso Musoev', '+992200008007', 'A. Navoi 35/40', 'tst', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-14 14:35:58.232', '2026-05-15 14:07:45.863');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('4471d958-9ac6-410f-a216-378485a9d4af', 'ORD-1778857393272-192', 'DELIVERED', 661.00, 'WHATSAPP', 'Iso Musoev', '+992001100081', 'A. Navoi 35/40', 'alo lutfan kame modern tez ored baroi man ', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-15 15:03:13.274', '2026-05-16 02:54:10.63');
INSERT INTO public.orders (id, "orderNumber", status, "totalAmount", "contactMethod", "clientName", "clientPhone", "clientAddress", note, "telegramMsgId", "userId", "createdAt", "updatedAt") VALUES ('b3d8f24c-8d5c-487a-b86e-1a8033332253', 'ORD-1779094552731-850', 'PROCESSING', 795.00, 'TELEGRAM', 'Iso Musoev', '+992205686884', 'A. Navoi 35/40', '', NULL, '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-18 08:55:52.733', '2026-05-18 11:55:42.495');


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('a485fd3c-6231-4012-9751-16801f4ac8ff', 1, 90.00, '37', 'Кабуд', '19591afd-cab7-4ac9-a4d3-eee063f9a754', 'a1f7b9ee-8918-4051-9298-773496f3fc05');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('1a6499c0-c908-4307-8dbf-8ec03a77422e', 1, 368.00, '37', 'Тиллоӣ', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', 'a1f7b9ee-8918-4051-9298-773496f3fc05');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('3343e323-a679-48a7-a815-760f4fb6c928', 1, 589.00, '36', 'Standard', '63c19b79-d609-41ef-b504-8e89e571b974', '12bc1bfb-b12c-476a-a6a6-64a36a658a14');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('aab87b03-dee4-4e51-96df-2caa3a0ee749', 3, 90.00, '36', 'Standard', '19591afd-cab7-4ac9-a4d3-eee063f9a754', 'bc4090f0-c266-4c40-94c2-687eb57d658a');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('a5ef5d52-f19b-407e-b33e-4d1389cea933', 1, 90.00, '36', 'Standard', '19591afd-cab7-4ac9-a4d3-eee063f9a754', '10aef994-ef3e-4d98-8dcb-8dc79b2c84c0');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('389f3292-c4a1-4fa1-8db5-1a0c4c7caafe', 1, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', '6eea491f-dd89-4b4c-a0cb-c1a775b30aa4');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('70307501-8ffb-4518-a3ee-416ce43f934c', 3, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', 'f243fc4e-b291-428d-8bfa-52923315c354');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('5e462651-02c9-4a96-b366-17fe0d7e0e70', 1, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', '8edaf29b-97e0-448d-97eb-e69db5a07dcf');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('b09f32d4-b43e-4df9-95d8-94f9877afe08', 2, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', '89607220-9178-444a-9619-3b3e4cc13bf8');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('4ca6536f-b963-46a3-88e3-9b7e3b0700a5', 1, 396.00, '38', 'Сурх', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', '7d94f98f-7189-4090-83e2-df88eaf8d298');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('ddba95f0-b854-4345-b61f-a09a51dee4e6', 1, 368.00, '36', 'Standard', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '6e2706e4-6df5-4dd9-9d89-fd1094aa5a23');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('0534dfd5-3997-4de1-a62b-047ee4f39cb8', 1, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', 'a32e08ed-93f0-409b-a2a0-debdd7dc4818');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('e73ac861-9fb9-43be-ac17-250f9a82d8ac', 1, 265.00, '35', 'Гулобӣ', 'd495019c-802f-4844-a72f-5a3a0859136e', '75f4d363-c0d1-4671-a2f0-5ee9adf73be3');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('2c931692-ca53-4534-be54-f0bc2a9c3dbd', 1, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', '2b3d1397-5fd3-4a9b-b8a8-95dc6ef13ea7');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('f15ea4ca-1cb6-4985-8787-6ca505efb177', 3, 368.00, '36', 'Standard', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '6c394a77-852f-48a7-ac7d-5867725b15cc');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('4b136d6e-d1c3-423e-990f-89fa920fa78f', 3, 368.00, '37', 'Сиёҳ', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '6c394a77-852f-48a7-ac7d-5867725b15cc');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('d46aa883-60bd-45f0-bf51-12a98b6cbd1e', 3, 368.00, '38', 'Сиёҳ', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '6c394a77-852f-48a7-ac7d-5867725b15cc');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('1692133d-34b8-4b3a-b692-59835565588e', 2, 334.40, '36', 'Standard', '523d9559-d612-4214-9c87-d2e969e8216c', 'f84f433d-241f-45f4-9ad5-8670f659b0ac');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('28e46993-ddf7-4c8a-8bd2-284fa534b949', 1, 368.00, '37', 'Тиллоӣ', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', 'ff894a7f-88df-4a20-ae02-c79899041bc2');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('0ff8ed4c-e747-479b-bdd6-83574f15c7a3', 2, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', 'f3ae8d41-ef79-4c3a-a30e-5f97927482cf');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('f2ed64f9-f863-45a0-8014-2c5958d71a93', 2, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', 'e7825ffa-425c-4f37-bb5b-5bd55375b255');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('a1ce7fdb-b2d7-494f-a60b-31bc367eacf2', 1, 480.00, '36', 'Standard', 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b', 'e7825ffa-425c-4f37-bb5b-5bd55375b255');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('00a24dae-64e9-4092-b0c2-a9a135346431', 1, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', 'e7825ffa-425c-4f37-bb5b-5bd55375b255');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('41462fe0-9fef-4c3b-8e3e-f5f6d0d48e48', 2, 90.00, '36', 'Standard', '19591afd-cab7-4ac9-a4d3-eee063f9a754', '2a514199-897e-4c16-bc80-feb8b0be33b6');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('52d4c536-96ee-4524-bbb8-eed3948bff48', 1, 480.00, '36', 'Standard', '32309873-790b-471f-ad29-52a9add7a5be', '5773347b-f5ae-4f2f-840a-c1868f47c580');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('9dbd1d19-c84c-40d1-a0a9-64ba3c26791a', 1, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', '5773347b-f5ae-4f2f-840a-c1868f47c580');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('fb3ad146-91a6-492c-b350-361c1df7c34b', 1, 368.00, '36', 'Standard', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '5773347b-f5ae-4f2f-840a-c1868f47c580');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('9eadd0d4-9f40-40e6-b0df-d579d38e87a8', 1, 396.00, '36', 'Standard', '78dd00d2-78ff-468a-a8b7-d1ae14551d43', '4471d958-9ac6-410f-a216-378485a9d4af');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('34b59357-4dfa-4beb-9b4a-1c2406d486a1', 1, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', '4471d958-9ac6-410f-a216-378485a9d4af');
INSERT INTO public.order_items (id, quantity, price, size, "colorName", "productId", "orderId") VALUES ('943a857a-30a2-4879-8c1a-b8550d44db29', 3, 265.00, '35', 'Standard', 'd495019c-802f-4844-a72f-5a3a0859136e', 'b3d8f24c-8d5c-487a-b86e-1a8033332253');


--
-- Data for Name: product_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('dd774c88-5974-48ee-9847-8e41c6c6ab2b', 'Сурх', 'Красный', 'Red', '#FF0000', '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('82fc959e-e16b-42bd-b04a-eae483079e97', 'Сафед', 'Белый', 'White', '#FFFFFF', '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('b3beb8b7-c780-4e1c-bac9-70cbddaf0998', 'Сиёҳ', 'Черный', 'Black', '#000000', '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('f7da5fa7-e8ad-4d19-a21b-a1dda7be4a8b', 'Қаҳваранг', 'Коричневый', 'Brown', '#8B4513', 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('aeb070de-ec9e-47c2-9d5b-1775db43c11f', 'Тиллоӣ', 'Золотой', 'Gold', '#FFD700', 'a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('85b9eba8-6839-4bef-9f8c-a09567a62bd7', 'Сиёҳ', 'Черный', 'Black', '#000000', '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('c56e84ab-c10f-4bb2-9d76-e12e60a38d10', 'Кабуд', 'Синий', 'Blue', '#0000FF', 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('e526d3a2-aa21-4cf0-9f18-f5b3d2c7d0b4', 'Нуқраӣ', 'Серебристый', 'Silver', '#C0C0C0', '8fe8403d-ae08-497f-b02b-733d148e0095');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('e3ae6f1b-81ae-4866-87db-3714c92ced45', 'Бежевый', 'Бежевый', 'Beige', '#F5F5DC', 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('67085aaf-0a0a-4e99-9898-40d1733480e8', 'Қаҳваранг', 'Коричневый', 'Brown', '#8B4513', '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('a7ff7414-7eac-4f8f-958f-0e375d6096a7', 'Сиёҳ', 'Черный', 'Black', '#000000', '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('d2fac258-c173-48df-b284-ff2682298df9', 'Гулобӣ', 'Розовый', 'Pink', '#FFC0CB', '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('1b0d3a6a-b13c-4b1f-b842-a42acc459556', 'Кабуд', 'Голубой', 'Sky Blue', '#87CEEB', '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('c1a7885f-8728-4f54-8244-cc9a003212c1', 'Хокистарӣ', 'Серый', 'Grey', '#808080', '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('1f92d87f-11ba-42bf-a301-2139ae834504', 'Хокистарӣ', 'Серый', 'Grey', '#A0A0A0', '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('fa7a4aaf-cb23-4a38-8b20-38edfdf41128', 'Зард', 'Желтый', 'Yellow', '#FFFF00', 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('f9058220-2b74-46b6-8b39-1c30b27cb1e6', 'Сурх', 'Красный', 'Red', '#FF0000', 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('ca7c4a06-b567-4c5c-b3b3-84ed8684a9ea', 'Кабуди торик', 'Темно-синий', 'Navy', '#000080', '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('4b28b30e-aef3-4c39-bc0a-04b487de1a16', 'Сиёҳ', 'Черный', 'Black', '#000000', '32d6262b-5697-4858-8ec7-532b9b7bb667');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('b408af76-d7b9-47c2-a858-b31b1b2e5ee8', 'Кабуд', 'Синий', 'Blue', '#4169E1', 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('82fbcd9f-0511-4ccc-b9f1-880dc9bc4dfc', 'Сиёҳ', 'Черный', 'Black', '#000000', '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('0361fb97-2b1f-4393-a582-d1b2322a26ca', 'Сафед', 'Белый', 'White', '#FFFFFF', 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('39d26acb-012b-4828-8a74-d55dbfd128cc', 'Сиёҳ', 'Черный', 'Black', '#000000', '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('51529b3e-dcb9-4b63-82bc-cdfa85b428d0', 'Тиллоӣ', 'Золотой', 'Gold', '#FFD700', '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('cba664d6-7d44-4617-a8c1-d7a664488170', 'Гулобӣ', 'Розовый', 'Pink', '#FFB6C1', 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('1afe2a61-58c2-48ea-b2d3-15a1974f288e', 'Сурх', 'Красный', 'Red', '#DC143C', '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('8c31f181-1f67-4c70-bbd2-648c6f9b3ad2', 'Тиллоӣ', 'Золотой', 'Gold', '#FFD700', 'b2c9f5fe-cbd0-4577-8264-25edd712fc15');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('18922fe6-abba-42e6-b9ef-8489824744e3', 'Зайтун', 'Оливковый', 'Olive', '#808000', '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_colors (id, name_tj, name_ru, name_en, "hexCode", "productId") VALUES ('99ce9fe6-af63-45a5-938c-401ed68bb09a', 'Хокистарӣ', 'Серый', 'Grey', '#696969', 'd208a378-fd10-4521-aad1-efdb1d7c798c');


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('fbd9b1a8-3801-4423-bd47-9c7c62bbea0d', '/uploads/placeholder-SKU001.jpg', true, 0, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('93539d11-7afd-43a8-bc3b-03bc22c07311', '/uploads/placeholder-SKU002.jpg', true, 0, '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('59902629-70b7-492b-aae9-b0ee204887dd', '/uploads/placeholder-SKU003.jpg', true, 0, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('04b699ed-b04d-480d-835c-2d9ce2352d04', '/uploads/placeholder-SKU004.jpg', true, 0, 'a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('8e65745b-65f6-49b0-9780-6c5b1a766d8a', '/uploads/placeholder-SKU005.jpg', true, 0, '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('33913ba3-a727-434a-a6ba-ac02a22b30ae', '/uploads/placeholder-SKU006.jpg', true, 0, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('91685764-54b1-470d-a6b8-92217a60b59e', '/uploads/placeholder-SKU007.jpg', true, 0, '8fe8403d-ae08-497f-b02b-733d148e0095');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('d825c54d-c07a-492b-8cb3-1cef86056290', '/uploads/placeholder-SKU008.jpg', true, 0, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('f390db54-fc61-4c4a-a436-a1e0c35bdeb7', '/uploads/placeholder-SKU009.jpg', true, 0, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('a35deb41-8c05-4d8a-96b7-fff0d71892c7', '/uploads/placeholder-SKU010.jpg', true, 0, '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('c601e5c3-07b8-4918-b3d0-78305a09898d', '/uploads/placeholder-SKU011.jpg', true, 0, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('986d1b86-481a-4985-b0ad-ac5a2249ce33', '/uploads/placeholder-SKU012.jpg', true, 0, '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('cf0e5514-ab51-40ae-b2b6-2dc6c5fc6212', '/uploads/placeholder-SKU013.jpg', true, 0, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('ab2e62ca-72b5-43f8-a631-c7e72fbee20d', '/uploads/placeholder-SKU014.jpg', true, 0, 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('007d469a-b13a-422b-9309-fba3a9780a82', '/uploads/placeholder-SKU015.jpg', true, 0, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('8741367a-4744-4dba-81a2-534aacb01343', '/uploads/placeholder-SKU016.jpg', true, 0, '32d6262b-5697-4858-8ec7-532b9b7bb667');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('7b48ca71-b50a-49c8-b8c8-1011f3f7cf11', '/uploads/placeholder-SKU017.jpg', true, 0, 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('6daefeae-8b7d-4446-86e8-0b94daefcd0a', '/uploads/placeholder-SKU018.jpg', true, 0, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('e8ac2d31-62bc-4627-b55c-9a3557533480', '/uploads/placeholder-SKU019.jpg', true, 0, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('6e9ba5ec-dcff-427f-9736-7d7d2e990f6d', '/uploads/placeholder-SKU020.jpg', true, 0, '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('f28273f9-42db-4555-a0de-1e3d801bd621', '/uploads/placeholder-SKU021.jpg', true, 0, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('b8ebbe24-4069-4811-ad5d-9863a3d6fa2b', '/uploads/placeholder-SKU022.jpg', true, 0, '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('a7939de4-2bd6-4efe-9816-a19655b22f79', '/uploads/placeholder-SKU023.jpg', true, 0, 'b2c9f5fe-cbd0-4577-8264-25edd712fc15');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('d4018aa3-f927-44e5-b5e4-3d451b090bf4', '/uploads/placeholder-SKU024.jpg', true, 0, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_images (id, url, "isMain", "order", "productId") VALUES ('914f5ce0-6de7-423a-a1ef-30795af43db1', '/uploads/placeholder-SKU025.jpg', true, 0, 'd208a378-fd10-4521-aad1-efdb1d7c798c');


--
-- Data for Name: product_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('cbf9babb-1867-4b2d-b1d4-045f8308a260', '36', 16, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('0be7aaa5-c1c3-42d5-b16e-e97867fcae16', '37', 13, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('e6f3dcf9-e103-46ba-b58f-aa9d0f8c9c83', '38', 10, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('b3b3a24b-f751-49f6-8807-4454d61d4758', '39', 8, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('abc308ac-aa00-4320-9117-5715524bf76f', '40', 17, '080ec70e-8991-43dd-a165-e8aa4d96129a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('98db7981-f55d-474b-a6db-b6b8f8684919', '36', 8, '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('9c6e3bf8-06a2-40bf-97d7-9ae59f6e802a', '37', 9, '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('cfe191ed-b908-4bfb-8bd0-6a17768e72d8', '38', 14, '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('174960a7-4fe6-4c55-bffa-a743d7161429', '39', 5, '3d252d8b-a737-4c7e-a8e0-c225b9092f8e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('d9e6f1b4-aa1b-42f8-a467-4faa1d44bc53', '36', 8, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('4f60065d-3894-4a30-8ea2-2089b626fb97', '37', 18, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('37aeb6de-7d95-4e7b-b3e7-121c3e5f1dd6', '38', 15, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('b3db8332-fb07-4f92-b017-967435aacbe9', '39', 10, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('75d45937-26f3-4466-ba0a-9c490596d930', '40', 11, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c08d693f-2a6d-41af-98e8-23fccefa23a6', '41', 14, 'ec0789df-5a3b-42c9-a7f2-afa7d3076091');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('a99a899a-5102-4ff8-8e66-61b7b445709b', '36', 19, 'a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('9590ca84-e117-4574-ab3f-d6c4f2bfbb8d', '37', 14, 'a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('7fa4fa6a-0fd9-4558-b458-f9b45e85fad8', '38', 9, 'a682c9ce-f8ef-4b00-a0c7-b17b20f1a2f5');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('8acb8566-012f-4825-8a3b-59ae413a37db', '36', 6, '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('36a5db3e-ea1f-41c0-bea0-d4eea115d2c7', '37', 9, '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('cf9d1cd0-6161-4849-89b6-5242f5bd5dc2', '38', 9, '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('2982b2a6-4a28-4c6e-8887-9c3f6550f62b', '39', 12, '38f5fc58-95df-4f6b-a502-dd1420977a25');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('e9ab4cfc-082a-46fb-b778-42c7ea0e7286', '36', 5, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('f1807fb5-6d44-4bcf-a4a5-61ba355a5d9e', '37', 15, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('51002053-d4be-4b35-b22e-d08f778ee73d', '38', 8, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('af75efb4-146c-49ad-955b-6d3e28cda6e3', '39', 12, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('d95e3ea6-0d8e-494f-a12f-be77062e192f', '40', 7, 'f6780e09-21ee-45a9-b735-5796511b64ce');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('cb2d5cc8-9252-4937-a46e-a97f08fe00a6', '36', 10, '8fe8403d-ae08-497f-b02b-733d148e0095');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('938e4abf-95db-4615-9bfe-97001297839e', '37', 5, '8fe8403d-ae08-497f-b02b-733d148e0095');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c9141ee1-1592-465d-b3d9-256a65607485', '38', 6, '8fe8403d-ae08-497f-b02b-733d148e0095');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('a3ef6e6c-2f08-4fd8-8f51-edf6c1a71835', '35', 18, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('423ca07c-7024-4a77-bfb2-deb3ecdc30c3', '36', 6, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('db2ce0b1-2cae-4158-92b5-85d75f6adb8f', '37', 15, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('dc7fda7e-56a0-4da4-a5d9-5e62f53c86e7', '38', 15, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('6c108f59-c046-458b-9105-7f19f69fe886', '39', 17, 'bc26cb99-e450-4935-b187-487dea1e802e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('9634bed0-6901-482a-bfac-12779d9e2629', '36', 17, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('aa1fd639-a9de-4e78-adc8-36bc2f6c33e9', '37', 16, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('7d3e466c-6541-4c41-8e45-8ac5f34015e5', '38', 16, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c36578ee-7cbd-445f-9f8b-d42806ec9da9', '39', 6, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('553a267f-a156-4b85-8ef1-bd11d758d948', '40', 14, '523d9559-d612-4214-9c87-d2e969e8216c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('50dfa21d-f1df-45d6-8c30-5a3de67ca8f5', '36', 10, '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('40c0964b-0987-47d2-8cc8-2d6e77ba44b3', '37', 8, '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('44948fe1-9ca7-47e3-b80d-1e9f63f5ea7c', '38', 14, '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('e4f78ff2-7a2d-4448-946a-860523d29398', '39', 13, '554aeb3d-1533-4be0-9ebf-48f9d9578b7f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('7a88262d-725d-4d54-a093-003d8186594d', '36', 19, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('d2a6868f-cbe6-46fb-be03-c5ba53322966', '37', 15, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('bad6d1d4-23ff-4c5e-a67e-f29b4941ae98', '38', 6, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('2611690e-31c5-4958-96c2-e997bb2dc975', '39', 8, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('41c26cdf-1742-4b14-9758-374048e45b03', '40', 6, '19591afd-cab7-4ac9-a4d3-eee063f9a754');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('b8b8a6ce-686a-4a50-8c1c-80d01563d2da', '36', 14, '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('127136b8-cd08-4f7c-95b3-98de150d5a57', '37', 12, '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('457c433c-6dc4-4cf9-9454-a49018d7b732', '38', 5, '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('66dbe06f-00e4-43f1-887e-fcb651daaad1', '39', 19, '2c963f7a-882d-444a-98e3-5a3bb4b0dc22');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c7a61dca-a5f5-48dd-b2b8-c3fd4660f463', '36', 11, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('45709b4d-a2fe-49bb-909c-1dca17c9191a', '37', 17, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('16a666c6-4b8a-4ca9-88af-2840aa1c4529', '38', 14, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('5aede65d-d469-40af-8a11-2566f1fe4bd0', '39', 10, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('1a2e4f0c-c4a9-4126-b903-077dd9746596', '40', 13, '31298554-fae7-4e5e-85ef-17de643d6498');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('491021b4-6ead-4b80-a8c3-b36de5b4d70d', '35', 9, 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('aac1f9a8-f844-4567-a6b4-9f51a3381d99', '36', 19, 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('a7a57cb3-76ba-4df7-934b-e3e0e079e868', '37', 8, 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('7f69e66c-6d1f-41d9-b513-81ee8275853a', '38', 5, 'c4e4a5cf-36d1-4615-8844-b5059d1fde60');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('4328f66d-f4e3-479f-a74b-084de48f504f', '36', 10, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('530d44a8-6d40-47f1-aec6-f90d5ee885d8', '37', 9, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c5a9a33a-bd02-4ccf-b18d-b30d85e3b6c1', '38', 10, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('f13bdb9d-4269-4702-9245-de25f91cd073', '39', 16, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('1cac4f0d-1d6b-4936-b85e-10bf90f8a8c3', '40', 5, '63c19b79-d609-41ef-b504-8e89e571b974');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('633076f7-618e-410c-8178-050f26c0cc5c', '36', 6, '32d6262b-5697-4858-8ec7-532b9b7bb667');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('a502fd02-f906-4e80-99c3-55c234f74575', '37', 5, '32d6262b-5697-4858-8ec7-532b9b7bb667');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('bf9eeebe-c00b-41bd-bd1a-bfb203ae9448', '38', 12, '32d6262b-5697-4858-8ec7-532b9b7bb667');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('53e0ad85-908a-496e-a279-79e6a3768eb5', '36', 17, 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('373cfecf-a16f-48d4-b4dc-b1a054f21a82', '37', 14, 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('82cd2933-5e0c-4881-a9be-6258b3728baf', '38', 6, 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('9bd8eb98-5244-46fc-b2c3-e9d055ff5c02', '39', 12, 'b89280c9-55e1-430d-9a85-cc6d6fb2738a');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('3e1f24c3-e659-4f85-bb26-5c1e4fb15e3f', '36', 16, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('2d25027e-61ed-4fba-8f2c-03a77a99a03d', '37', 18, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('a33ad2c8-2c77-4fca-8c31-3f993455c14a', '38', 6, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('ddd485ce-4772-45b6-80ff-d0829538ecbf', '39', 17, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('249bf5dd-69c1-410c-9434-0063869eb9ad', '40', 12, '7a21a38c-1267-4c98-81ed-5dcbfa3aa7bc');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('c88cb12a-0305-4dab-bd03-9da436078603', '36', 19, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('d71ca9fb-5a9e-4361-a19a-c6666e898e66', '37', 11, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('637b777a-1a62-469c-872c-62a16e1998eb', '38', 17, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('0b35812a-da7f-4219-ab08-ca7107a11409', '39', 19, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('3a5d5c19-be88-4f91-8987-ae89c2c1c076', '40', 16, 'b6e4ba93-2e88-46e5-93fc-fe3cffff876b');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('8162eb57-3fc2-479f-b27a-fe6cc7b516b9', '36', 14, '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('6c325774-d554-4595-87b7-5b6442e362d6', '37', 17, '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('caebdb7b-0a75-4f1d-b70c-1296a1e26f78', '38', 13, '6c82d245-1804-4f30-87b8-1f3051a3ce6f');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('0275215c-aacd-4146-88c6-f43ce3033413', '35', 6, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('fe54b914-9bcb-43e5-96bb-6b9cf28d9015', '36', 16, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('f03f1422-4a77-4ae2-8cee-53837b5e3d9f', '37', 8, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('4d0f2516-b25e-4579-8136-faea8b9b2c3e', '38', 5, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('0a3338c9-f65e-46be-a8ec-4a8cbd4b4474', '39', 15, 'd495019c-802f-4844-a72f-5a3a0859136e');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('ff100f41-5ff4-42b5-bec7-b95c6fa24037', '36', 19, '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('acecba4f-dfb7-4de5-b39b-ba17ad3c5c6b', '37', 10, '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('8ff29a16-f803-406f-b12d-597d9e60c43d', '38', 12, '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('be479228-b6dc-4a9c-ae83-7e1dfabb9baf', '39', 18, '78dd00d2-78ff-468a-a8b7-d1ae14551d43');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('b25cb04b-4a04-4684-9a8a-5c595ceb48b9', '36', 11, 'b2c9f5fe-cbd0-4577-8264-25edd712fc15');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('94819c4a-2b08-491b-996b-da0eece45f92', '37', 19, 'b2c9f5fe-cbd0-4577-8264-25edd712fc15');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('3c28d91d-6ed3-480f-8b1f-18fefa7796a0', '38', 6, 'b2c9f5fe-cbd0-4577-8264-25edd712fc15');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('978e1756-5588-4e5c-a2a4-bd11095e53e0', '36', 7, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('3c85128b-bdec-4e66-8d40-4443930d8d6e', '37', 10, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('003b7aa0-e802-4e0a-a908-5b412254ddc6', '38', 8, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('5a9c360e-a72c-4417-9ef8-f481ad0ae0f7', '39', 16, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('9c42ac82-16ca-4a9d-9324-99062d71e0b2', '40', 8, '32309873-790b-471f-ad29-52a9add7a5be');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('dd93f6e2-2c63-4922-8000-5154502ed138', '36', 5, 'd208a378-fd10-4521-aad1-efdb1d7c798c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('368d72a4-6ac1-489a-b553-2415a9fa36d8', '37', 17, 'd208a378-fd10-4521-aad1-efdb1d7c798c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('cb811e1a-6d8d-42a7-88f5-5ce4d63feabc', '38', 11, 'd208a378-fd10-4521-aad1-efdb1d7c798c');
INSERT INTO public.product_sizes (id, size, stock, "productId") VALUES ('7bbae503-5e83-4b03-a170-1e1cf9261941', '39', 16, 'd208a378-fd10-4521-aad1-efdb1d7c798c');


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.refresh_tokens (id, token, "userId", "expiresAt", "createdAt") VALUES ('a49b44fc-fdf1-4d81-abdf-f5c02d534be6', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YmNmZjc2MC02OGIyLTQxZjUtODA5Ny04YjI4NzJiNmEwODQiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc3OTE5MDE5MCwiZXhwIjoxNzc5Nzk0OTkwfQ.I-PxJfzefdMv4YN3qSCKBixcIRQg0XldIhV3bzzi8fM', '5bcff760-68b2-41f5-8097-8b2872b6a084', '2026-05-26 11:29:50.023', '2026-05-19 11:29:50.041');
INSERT INTO public.refresh_tokens (id, token, "userId", "expiresAt", "createdAt") VALUES ('de8720f2-49fa-4baf-a7a1-f4a2a2af6743', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhODlmN2FiZi1lODU1LTQwMDQtOTEyNC1kNzU4NTFiYjM2MjkiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3NzkxOTE5OTQsImV4cCI6MTc3OTc5Njc5NH0.RV1IiWU33NLeJ8g4ZuRZRTKVJQ47kUhYSPqwVDc77HA', 'a89f7abf-e855-4004-9124-d75851bb3629', '2026-05-26 11:59:54.838', '2026-05-19 11:59:54.86');


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reviews (id, rating, comment, "userId", "productId", "createdAt", "updatedAt", status) VALUES ('256db1d0-2f0a-4db1-8ba0-8f839b546f4e', 5, 'behtarin mahsulot 👏🏼👏🏼👏🏼👏🏼👏🏼', '5bcff760-68b2-41f5-8097-8b2872b6a084', '19591afd-cab7-4ac9-a4d3-eee063f9a754', '2026-05-14 16:20:15.134', '2026-05-18 10:20:34.37', 'APPROVED');
INSERT INTO public.reviews (id, rating, comment, "userId", "productId", "createdAt", "updatedAt", status) VALUES ('9730a45b-90cd-49ea-a8f1-b3ed02ceafcc', 5, 'Az 5 ball ba shumo 10', '5bcff760-68b2-41f5-8097-8b2872b6a084', '6c82d245-1804-4f30-87b8-1f3051a3ce6f', '2026-05-14 16:12:54.804', '2026-05-18 10:20:38.087', 'APPROVED');
INSERT INTO public.reviews (id, rating, comment, "userId", "productId", "createdAt", "updatedAt", status) VALUES ('fa7d7e4f-f8b6-44e0-9da3-a54f514aff74', 5, 'behtarin mahsulot va bo tezrasoni 
', '5bcff760-68b2-41f5-8097-8b2872b6a084', '554aeb3d-1533-4be0-9ebf-48f9d9578b7f', '2026-05-18 11:54:21.907', '2026-05-19 09:58:05.234', 'APPROVED');


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.settings (id, "telegramBotToken", "telegramChatId", "whatsappNumber", "storeName_tj", "storeName_ru", "storeName_en", "storePhone", "storeAddress_tj", "storeAddress_ru", "storeAddress_en", "storeEmail", logo) VALUES ('f22ce1a2-9088-453d-b78b-923dc5f12815', '8735378295:AAGNUCfyqx95X7vekQ2Qu4vVzl2JNFhgMK0', '-1001234567890', '+992 205686884', 'Мағозаи пойафзоли занона', 'Магазин женской обуви', 'Women''s Shoe Store', '205686884', 'ш. Душанбе, 1-ум Советский, назди маркази савдо', 'г. Душанбе, 1 Советский, рядом с торговым центром', 'Dushanbe, 1st Sovetskiy, near shopping center', 'musoeviso46@gmail.com', '/uploads/general/1def2445-06a0-4e8c-9ee0-d1d10ca69517.webp');


--
-- PostgreSQL database dump complete
--

\unrestrict 5PcNRoeZY4ukLWY6GKjaMEMsKWlYtCsYxEdphUI8TpDbZwv9Lc5Lpl5fioRhJME

