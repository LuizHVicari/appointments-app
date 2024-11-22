import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { ApiOkResponse } from '@nestjs/swagger';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('sanity-check')
  @ApiOkResponse({type: String, description: 'asserts that it can connect to the API'})
  getHello(): string {
    return this.appService.getHello();
  }
}
