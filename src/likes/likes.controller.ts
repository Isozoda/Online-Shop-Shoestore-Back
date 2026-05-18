import { Controller, Post, Get, Param, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { LikesService } from './likes.service';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { ParseUUIDPipe } from '../common/pipes/parse-uuid.pipe';

@ApiTags('likes')
@Controller('likes')
@UseGuards(JwtAuthGuard)
@ApiBearerAuth('access-token')
export class LikesController {
  constructor(private readonly likesService: LikesService) {}

  @Post(':productId')
  @ApiOperation({ summary: 'Лайк / Анлайк маҳсулот' })
  toggle(@CurrentUser('id') userId: string, @Param('productId', ParseUUIDPipe) productId: string) {
    return this.likesService.toggle(userId, productId);
  }

  @Get()
  @ApiOperation({ summary: 'Маҳсулоти дӯстдоштаи корбор' })
  getMyLikes(@CurrentUser('id') userId: string) {
    return this.likesService.getMyLikes(userId);
  }
}
