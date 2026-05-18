import { Injectable, BadRequestException } from '@nestjs/common';
import * as sharp from 'sharp';
import { join, extname } from 'path';
import { v4 as uuidv4 } from 'uuid';
import * as fs from 'fs';

@Injectable()
export class UploadsService {
  async processImage(file: Express.Multer.File, folder: string): Promise<string> {
    if (!file) throw new BadRequestException('Файл интихоб нашудааст');

    const uploadDir = join(process.cwd(), 'uploads', folder);
    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true });
    }

    const filename = `${uuidv4()}.webp`;
    const outputPath = join(uploadDir, filename);

    await (sharp as any)(file.path || file.buffer)
      .resize(800, 800, { fit: 'inside', withoutEnlargement: true })
      .webp({ quality: 80 })
      .toFile(outputPath);

    if (file.path && fs.existsSync(file.path)) {
      fs.unlinkSync(file.path);
    }

    return `/uploads/${folder}/${filename}`;
  }
}
