import { Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/entities/user.entity';
import { Repository } from 'typeorm';
import jwtConfig from './config/jwt.config';
import { ConfigType } from '@nestjs/config';
import { HashingServiceProtocol } from './hashing/hashing.service';
import { RefreshDto } from './dto/refresh.dto';

@Injectable()
export class AuthService {
  
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    private jwtService: JwtService,
    @Inject(jwtConfig.KEY)
    private readonly jwtSettings: ConfigType<typeof jwtConfig>,
    private readonly hashingService: HashingServiceProtocol
  ) {}

  async validateUser(username: string, password: string) {
    const user = await this.userRepository.findOneBy({
      email: username
    })

    if (!user) {
      throw new UnauthorizedException('Incorrect e-mail or password')
    }
    if (this.hashingService.compare(password, user.password)) {
      return await this.generateTokens(user)
    }
    throw new UnauthorizedException('Incorrect e-mail or password')
  }

  private async generateRefreshToken(user: User) {
    const refreshToken = this.jwtService.sign({email: user.email}, {
      secret: this.jwtSettings.refreshSecret,
      expiresIn: this.jwtSettings.refreshExpiresIn
    })

    return refreshToken
  }

  private async generateAccessToken(user: User) {
    const accessToken = this.jwtService.sign({
        email: user.email
      }, {
        secret: this.jwtSettings.secret,
        expiresIn: this.jwtSettings.expiresIn
      })
      return accessToken
  }

  private async generateTokens(user: User) {
    const accessToken = await this.generateAccessToken(user)
    const refreshToken = await this.generateRefreshToken(user)
    return {
      accessToken,
      refreshToken
    }
  }

  async refreshToken(body: RefreshDto) {
    const payload: User = await this.verifyRefreshToken(body);
    return {accessToken: await this.generateAccessToken(payload)}
  }

  private async verifyRefreshToken(body: RefreshDto) {
    const refreshToken = body.refreshToken

    if (!refreshToken) {
      throw new UnauthorizedException('Invalid or expired token')
    }

    const email = this.jwtService.decode(refreshToken)['email']
    const user = await this.userRepository.findOneBy({email})

    if (!user) {
      throw new UnauthorizedException('Invalid or expired token')
    }

    try {
      this.jwtService.verify(refreshToken, {
        secret: this.jwtSettings.refreshSecret
      })
      return user
    } catch (error) {
      if (error.name === 'JsonWebTokenError' || error.name === 'TokenExpiredError') {
        throw new UnauthorizedException('Invalid or expired token')
      }
      throw new UnauthorizedException(error.name)
    }
  }

}

