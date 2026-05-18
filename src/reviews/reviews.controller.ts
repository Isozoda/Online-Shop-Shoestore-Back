import { Controller, Post, Get, Delete, Patch, Body, Param, Query, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { ReviewsService } from './reviews.service';
import { CreateReviewDto } from './dto/create-review.dto';
import { UpdateReviewStatusDto } from './dto/update-review-status.dto';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { RolesGuard } from '../common/guards/roles.guard';
import { Roles } from '../common/decorators/roles.decorator';
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { ParseUUIDPipe } from '../common/pipes/parse-uuid.pipe';
import { Role } from '@prisma/client';

@ApiTags('reviews')
@Controller('reviews')
export class ReviewsController {
  constructor(private readonly reviewsService: ReviewsService) {}

  @Post()
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Гузоштани шарҳ ба маҳсулот' })
  create(@CurrentUser('id') userId: string, @Body() dto: CreateReviewDto) {
    return this.reviewsService.create(userId, dto);
  }

  @Get('latest')
  @ApiOperation({ summary: 'Шарҳҳои нави мизоҷон' })
  getLatestReviews() {
    return this.reviewsService.getLatestReviews();
  }

  @Get('product/:productId')
  @ApiOperation({ summary: 'Шарҳҳои маҳсулот' })
  getProductReviews(@Param('productId', ParseUUIDPipe) productId: string) {
    return this.reviewsService.getProductReviews(productId);
  }

  @Delete(':id')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Нест кардани шарҳ' })
  remove(
    @CurrentUser('id') userId: string,
    @CurrentUser('role') userRole: string,
    @Param('id', ParseUUIDPipe) id: string,
  ) {
    return this.reviewsService.remove(userId, id, userRole);
  }

  @Get()
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(Role.ADMIN)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Тамоми шарҳҳо (ADMIN)' })
  findAll(@Query('status') status?: string) {
    return this.reviewsService.findAll(status);
  }

  @Patch(':id/status')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(Role.ADMIN)
  @ApiBearerAuth('access-token')
  @ApiOperation({ summary: 'Тағйири ҳолати шарҳ (ADMIN)' })
  updateStatus(
    @Param('id', ParseUUIDPipe) id: string,
    @Body() dto: UpdateReviewStatusDto,
  ) {
    return this.reviewsService.updateStatus(id, dto.status);
  }
}
