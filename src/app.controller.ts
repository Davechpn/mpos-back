import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller({ path: 'cats' })
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get("hello")
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('delete')
  async deleteAll() {
    return await this.appService.deleteData();
  }
}
