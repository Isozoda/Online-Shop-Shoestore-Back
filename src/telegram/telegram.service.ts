import { Injectable, Logger, OnModuleInit } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import TelegramBot from 'node-telegram-bot-api';

@Injectable()
export class TelegramService implements OnModuleInit {
  private bot: TelegramBot | null = null;
  private chatId: string;
  private readonly logger = new Logger(TelegramService.name);

  constructor(private config: ConfigService) {}

  onModuleInit() {
    const token = this.config.get<string>('TELEGRAM_BOT_TOKEN');
    this.chatId = this.config.get<string>('TELEGRAM_CHAT_ID') ?? '';

    if (!token || token === 'your_bot_token_here' || !this.chatId) {
      this.logger.warn('Telegram token ё chat ID ёфт нашуд — бот хомӯш аст');
      return;
    }

    try {
      this.bot = new TelegramBot(token, { polling: false });
      this.logger.log('Telegram бот тайёр аст');
    } catch (err) {
      this.logger.error('Telegram бот оғоз нашуд:', err);
    }
  }

  async sendOrderNotification(order: {
    orderNumber: string;
    clientName: string;
    clientPhone: string;
    contactMethod: string;
    totalAmount: number;
    items: Array<{ productName: string; quantity: number; size: string; price: number }>;
    note?: string;
  }) {
    if (!this.bot) return;

    const itemsList = order.items
      .map((i) => `  • ${i.productName} | Андоза: ${i.size} | ${i.quantity} дона | ${i.price} сомонӣ`)
      .join('\n');

    const contactEmoji = order.contactMethod === 'TELEGRAM' ? 'Telegram' : 'WhatsApp';

    const message = `
ФАРМОИШИ НАВ #${order.orderNumber}
Номи мизоҷ: ${order.clientName}
Телефон: ${order.clientPhone}
Тарзи тамос: ${contactEmoji}
Маҳсулотҳо:
${itemsList}
Маблағи умумӣ: ${order.totalAmount} сомонӣ
${order.note ? `Эзоҳ: ${order.note}` : ''}
    `.trim();

    const keyboard = {
      inline_keyboard: [
        [
          { text: 'Тасдиқ кардан', callback_data: `confirm_${order.orderNumber}` },
          { text: 'Бекор кардан', callback_data: `cancel_${order.orderNumber}` },
        ],
      ],
    };

    try {
      await this.bot.sendMessage(this.chatId, message, {
        reply_markup: keyboard,
      });
    } catch (err) {
      this.logger.error('Телеграм хато:', (err as Error).message);
    }
  }

  async sendMessage(text: string) {
    if (!this.bot || !this.chatId) return;
    try {
      await this.bot.sendMessage(this.chatId, text);
    } catch (err) {
      this.logger.error('Telegram sendMessage хато:', (err as Error).message);
    }
  }
}
