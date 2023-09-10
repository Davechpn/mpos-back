import { Module } from '@nestjs/common';
import { PackagesService } from './packages.service';
import { PackagesGateway } from './packages.gateway';

@Module({
  providers: [PackagesGateway, PackagesService],
})
export class PackagesModule {}
