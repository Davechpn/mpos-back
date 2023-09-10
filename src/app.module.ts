import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PackagesModule } from './models/premiums/packages/packages.module';
import { FeaturesModule } from './models/premiums/features/features.module';


@Module({
  imports: [ FeaturesModule, PackagesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
