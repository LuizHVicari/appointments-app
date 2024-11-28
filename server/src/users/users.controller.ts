import {
  Body,
  Controller,
  Delete,
  Get,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common'
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiOkResponse,
} from '@nestjs/swagger'
import { Request } from 'express'
import { AuthenticationGuard } from 'src/auth/guards/auth.guard'
import { CreateUserDto } from './dto/create-user.dto'
import { UpdateUserDto } from './dto/update-user.dto'
import { User } from './entities/user.entity'
import { UsersService } from './users.service'

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  @ApiCreatedResponse({ type: User, description: 'Creates a new user' })
  async create(@Body() createUserDto: CreateUserDto): Promise<User> {
    return await this.usersService.create(createUserDto)
  }

  @UseGuards(AuthenticationGuard)
  @Get()
  @ApiBearerAuth()
  @ApiOkResponse({ type: User, description: 'Gets the user information' })
  findMe(@Req() request: Request): User {
    return this.usersService.retrieveFromRequest(request)
  }

  @UseGuards(AuthenticationGuard)
  @Patch()
  @ApiBearerAuth()
  @ApiCreatedResponse({ type: User, description: 'Updates user data' })
  async patch(
    @Req() request: Request,
    @Body() updateUserDto: UpdateUserDto,
  ): Promise<User> {
    return await this.usersService.update(request, updateUserDto)
  }

  @UseGuards(AuthenticationGuard)
  @Delete()
  @ApiNoContentResponse({ type: User, description: 'Deletes user data' })
  async remove(@Req() request: Request): Promise<User> {
    return await this.usersService.remove(request)
  }
}
