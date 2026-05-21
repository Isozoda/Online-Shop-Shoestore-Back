import { Injectable, BadRequestException, InternalServerErrorException } from '@nestjs/common';
import * as sharp from 'sharp';
import { join } from 'path';
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

    const source = file.path || file.buffer;
    if (!source) {
      throw new BadRequestException('Файли тасвир нодуруст аст');
    }

    try {
      await (sharp as any)(source)
        .resize(800, 800, { fit: 'inside', withoutEnlargement: true })
        .webp({ quality: 80 })
        .toFile(outputPath);
    } catch (error) {
      throw new InternalServerErrorException('Қатогӣ ҳангоми коркарди тасвир');
    }

    if (file.path && fs.existsSync(file.path)) {
      try {
        fs.unlinkSync(file.path);
      } catch {
        // ignore cleanup failures
      }
    }

    return `/uploads/${folder}/${filename}`;
  }
}
