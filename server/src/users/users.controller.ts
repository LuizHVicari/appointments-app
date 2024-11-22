import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { ApiBearerAuth, ApiCreatedResponse, ApiOkResponse } from '@nestjs/swagger';
import { Request } from 'express';
import { AuthenticationGuard } from 'src/auth/guards/auth.guard';
import { User } from './entities/user.entity';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  @ApiCreatedResponse({type: User, description: 'Creates a new user'})
  async create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @UseGuards(AuthenticationGuard)
  @Get()
  @ApiBearerAuth()
  @ApiOkResponse({type: User, description: 'Gets the user information'})
  async findMe(@Req() request: Request) {
    return this.usersService.findMe(request);
  }

 
}
