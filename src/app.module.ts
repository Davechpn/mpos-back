import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PackagesModule } from './models/premiums/packages/packages.module';
import { FeaturesModule } from './models/premiums/features/features.module';
import { PrismaService } from './prisma.service';
import { RouterModule } from '@nestjs/core/router';


@Module({
  imports: [
    FeaturesModule,
    PackagesModule,
    // RouterModule.register([
    //   {
    //     path: 'da',
    //     module: DashboardModule,
    //   },
    // ]),
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule { }
