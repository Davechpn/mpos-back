import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { IndustriesModule } from './models/domains/industries/industries.module';
import { CountriesModule } from './models/domains/countries/countries.module';
import { PrismaService } from './prisma.service';
import { FeaturesModule } from './models/premiums/features/features.module';
import { PackagesModule } from './models/premiums/packages/packages.module';
import { PromotionsModule } from './models/premiums/promotions/promotions.module';
import { UsersModule } from './models/internal/users/users.module';
import { RolesModule } from './models/internal/roles/roles.module';
import { DomainsModule } from './models/internal/domains/domains.module';
import { PermissionsModule } from './models/internal/permissions/permissions.module';


@Module({
  imports: [
    FeaturesModule,
    PackagesModule,
    CountriesModule,
    IndustriesModule,
    PromotionsModule,
    UsersModule,
    RolesModule,
    DomainsModule,
    PermissionsModule,
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
