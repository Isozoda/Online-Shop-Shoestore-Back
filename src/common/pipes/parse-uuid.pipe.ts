import { PipeTransform, Injectable, BadRequestException } from '@nestjs/common';
import { validate as uuidValidate } from 'uuid';

@Injectable()
export class ParseUUIDPipe implements PipeTransform<string> {
  transform(value: string): string {
    if (!uuidValidate(value)) {
      throw new BadRequestException(`"${value}" UUID-и дуруст нест`);
    }
    return value;
  }
}
