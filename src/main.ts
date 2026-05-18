import { NestFactory, Reflector } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe, ClassSerializerInterceptor } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import * as cookieParser from 'cookie-parser';
import helmet from 'helmet';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.use(helmet({
    crossOriginResourcePolicy: { policy: "cross-origin" }
  }));
  app.use(cookieParser());

  app.enableCors({
    origin: (origin, callback) => {
      if (!origin) return callback(null, true);
      const allowedOrigins = [
        'http://localhost:5173',
        'http://127.0.0.1:5173',
        'http://[::1]:5173',
        'http://localhost:5174',
        'http://127.0.0.1:5174',
        'http://[::1]:5174',
        process.env.FRONTEND_URL,
        process.env.ADMIN_URL,
      ].filter(Boolean) as string[];

      const isAllowed = allowedOrigins.includes(origin) || 
                        /^http:\/\/localhost:\d+$/.test(origin) || 
                        /^http:\/\/127\.0\.0\.1:\d+$/.test(origin) || 
                        /^http:\/\/\[::1\]:\d+$/.test(origin);

      if (isAllowed) {
        callback(null, true);
      } else {
        callback(null, true); // Fallback to true in dev to completely avoid CORS aborts
      }
    },
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'Accept', 'X-Requested-With'],
  });

  app.setGlobalPrefix('api');

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  app.useGlobalInterceptors(new ClassSerializerInterceptor(app.get(Reflector)));

  const config = new DocumentBuilder()
    .setTitle('Shoe Store API')
    .setDescription('Интернет-мағозаи пойафзоли занона — API Документатсия')
    .setVersion('1.0')
    .addBearerAuth(
      { type: 'http', scheme: 'bearer', bearerFormat: 'JWT' },
      'access-token',
    )
    .addTag('auth', 'Аутентификатсия')
    .addTag('users', 'Корбарон')
    .addTag('products', 'Маҳсулотҳо')
    .addTag('categories', 'Категорияҳо')
    .addTag('brands', 'Брендҳо')
    .addTag('cart', 'Сабад')
    .addTag('orders', 'Фармоишҳо')
    .addTag('likes', 'Лайкҳо')
    .addTag('reviews', 'Шарҳҳо')
    .addTag('banners', 'Баннерҳо')
    .addTag('dashboard', 'Дашборд')
    .addTag('settings', 'Танзимот')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api/docs', app, document, {
    swaggerOptions: { persistAuthorization: true },
  });

  const port = process.env.PORT || 3000;
  await app.listen(port, '0.0.0.0');
  console.log(`Server дар http://localhost:${port} кор мекунад`);
  console.log(`Swagger: http://localhost:${port}/api/docs`);
}

bootstrap();
