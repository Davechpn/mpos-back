import { Module } from '@nestjs/common';
import { IndustriesService } from './industries.service';
import { IndustriesController } from './industries.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [IndustriesController],
  providers: [IndustriesService, PrismaService],
})
export class IndustriesModule { }
