import { Body, Controller, Post } from '@nestjs/common'
import {
  ApiCreatedResponse,
  ApiTags,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger'
import { AuthService } from './auth.service'
import { LoginDto } from './dto/login.dto'
import { RefreshDto } from './dto/refresh.dto'

@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('login')
  @ApiCreatedResponse({
    description: 'Returns both access and refresh tokens',
    schema: {
      type: 'object',
      properties: {
        accessToken: { type: 'string' },
        refreshToken: { type: 'string' },
      },
    },
  })
  @ApiUnauthorizedResponse()
  async login(@Body() body: LoginDto) {
    return this.authService.validateUser(body.email, body.password)
  }

  @Post('refresh')
  @ApiCreatedResponse({
    description: 'Returns the access token from a refresh one',
    schema: {
      type: 'object',
      properties: {
        accessToken: { type: 'string' },
      },
    },
  })
  @ApiUnauthorizedResponse()
  async refresh(@Body() body: RefreshDto) {
    'aaaaaaaaaaa'
    return this.authService.refreshToken(body)
  }
}
