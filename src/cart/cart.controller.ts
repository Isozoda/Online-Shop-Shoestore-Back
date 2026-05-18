import { Controller, Get, Post, Patch, Delete, Body, Param, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { CartService } from './cart.service';
import { AddToCartDto } from './dto/add-to-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { ParseUUIDPipe } from '../common/pipes/parse-uuid.pipe';

@ApiTags('cart')
@Controller('cart')
@UseGuards(JwtAuthGuard)
@ApiBearerAuth('access-token')
export class CartController {
  constructor(private readonly cartService: CartService) {}

  @Get()
  @ApiOperation({ summary: 'Сабади корбори ҷорӣ' })
  getCart(@CurrentUser('id') userId: string) {
    return this.cartService.getCart(userId);
  }

  @Post()
  @ApiOperation({ summary: 'Илова кардан ба сабад' })
  addToCart(@CurrentUser('id') userId: string, @Body() dto: AddToCartDto) {
    return this.cartService.addToCart(userId, dto);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Тағйири миқдор дар сабад' })
  updateCartItem(
    @CurrentUser('id') userId: string,
    @Param('id', ParseUUIDPipe) id: string,
    @Body() dto: UpdateCartDto,
  ) {
    return this.cartService.updateCartItem(userId, id, dto);
  }

  @Delete()
  @ApiOperation({ summary: 'Тозакунии пурраи сабад' })
  clearCart(@CurrentUser('id') userId: string) {
    return this.cartService.clearCart(userId);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Нест кардани маводи сабад' })
  removeFromCart(@CurrentUser('id') userId: string, @Param('id', ParseUUIDPipe) id: string) {
    return this.cartService.removeFromCart(userId, id);
  }
}
