import { Module } from '@nestjs/common';
import { FeaturesService } from './features.service';
import { FeaturesGateway } from './features.gateway';
import { PrismaService } from 'src/prisma.service';

@Module({
  providers: [FeaturesGateway, FeaturesService, PrismaService],
})
export class FeaturesModule {}
