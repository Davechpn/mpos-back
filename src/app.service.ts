import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Injectable()
export class AppService {

  constructor(private prisma: PrismaService) {

  }
  getHello(): string {
    console.log('On hello')
    return 'Hello World!';
  }

  async deleteData() {
    await this.prisma.user.deleteMany();
    return await this.prisma.feature.deleteMany()
  }
}
