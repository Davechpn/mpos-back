import { Module } from '@nestjs/common';
import { DomainsService } from './domains.service';
import { DomainsController } from './domains.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [DomainsController],
  providers: [DomainsService, PrismaService],
})
export class DomainsModule { }
