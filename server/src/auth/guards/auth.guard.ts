import {
  CanActivate,
  ExecutionContext,
  Inject,
  UnauthorizedException,
} from '@nestjs/common'
import { JwtService, TokenExpiredError } from '@nestjs/jwt'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import { User } from 'src/users/entities/user.entity'
import { Repository } from 'typeorm'
import jwtConfig from '../config/jwt.config'
import { ConfigType } from '@nestjs/config'
import { REQUEST_TOKEN_PAYLOAD } from 'src/common/constants'

export class AuthenticationGuard implements CanActivate {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    private readonly jwtService: JwtService,
    @Inject(jwtConfig.KEY)
    private readonly jwtSettings: ConfigType<typeof jwtConfig>,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    try {
      const request: Request = context.switchToHttp().getRequest()
      const { authorization } = request.headers

      if (!authorization) {
        throw new UnauthorizedException('Token was not provided')
      }

      const authToken = authorization.replace('Bearer', '').trim()
      const payload = await this.jwtService.verifyAsync(authToken, {
        secret: this.jwtSettings.secret,
      })

      const user = await this.userRepository.findOneBy({ email: payload.email })
      if (!user) {
        throw new UnauthorizedException('Invalid or expired token')
      }

      payload['user'] = user
      request[REQUEST_TOKEN_PAYLOAD] = payload
      return true
    } catch (error) {
      if (error instanceof TokenExpiredError) {
        console.warn('AuthGuard - Token expired')
        throw new UnauthorizedException('Token has expired')
      }

      console.warn(`AuthGuard - Could not authenticate, error: ${error}`)
      throw new UnauthorizedException()
    }
  }
}
