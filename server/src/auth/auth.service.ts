import { Inject, Injectable, UnauthorizedException } from '@nestjs/common'
import { ConfigType } from '@nestjs/config'
import { JwtService } from '@nestjs/jwt'
import { InjectRepository } from '@nestjs/typeorm'
import { User } from 'src/users/entities/user.entity'
import { Repository } from 'typeorm'
import jwtConfig from './config/jwt.config'
import { RefreshDto } from './dto/refresh.dto'
import { HashingServiceProtocol } from './hashing/hashing.service'

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    private jwtService: JwtService,
    @Inject(jwtConfig.KEY)
    private readonly jwtSettings: ConfigType<typeof jwtConfig>,
    private readonly hashingService: HashingServiceProtocol,
  ) {}

  async validateUser(
    username: string,
    password: string,
  ): Promise<{
    accessToken: string
    refreshToken: string
  }> {
    const user = await this.findUserByEmail(username)
    await this.compareUserPassword(user, password)
    return await this.generateTokens(user)
  }

  private async findUserByEmail(email: string): Promise<User> {
    const user = await this.userRepository
      .createQueryBuilder()
      .where('LOWER(email) = LOWER(:email)', { email })
      .getOne()
    if (!user) {
      throw new UnauthorizedException()
    }
    return user
  }

  private async compareUserPassword(
    user: User,
    password: string,
  ): Promise<void> {
    const equalPasswords = await this.hashingService.compare(
      password,
      user.password,
    )
    if (!equalPasswords) throw new UnauthorizedException()
  }

  private async generateRefreshToken(user: User): Promise<string> {
    const refreshToken = this.jwtService.sign(
      { email: user.email },
      {
        secret: this.jwtSettings.refreshSecret,
        expiresIn: this.jwtSettings.refreshExpiresIn,
      },
    )
    return refreshToken
  }

  private async generateAccessToken(user: User): Promise<string> {
    const accessToken = this.jwtService.sign(
      {
        email: user.email,
      },
      {
        secret: this.jwtSettings.secret,
        expiresIn: this.jwtSettings.expiresIn,
      },
    )
    return accessToken
  }

  private async generateTokens(user: User): Promise<{
    accessToken: string
    refreshToken: string
  }> {
    const accessToken = await this.generateAccessToken(user)
    const refreshToken = await this.generateRefreshToken(user)
    return {
      accessToken,
      refreshToken,
    }
  }

  async refreshToken(body: RefreshDto): Promise<{
    accessToken: string
  }> {
    const payload: User = await this.verifyRefreshToken(body.refreshToken)
    return { accessToken: await this.generateAccessToken(payload) }
  }

  private async verifyRefreshToken(refreshToken: string): Promise<User> {
    if (!refreshToken) {
      throw new UnauthorizedException()
    }

    const email = this.decodeToken(refreshToken)
    const user = await this.findUserByEmail(email)

    if (!user) {
      throw new UnauthorizedException()
    }

    this.verifyToken(refreshToken)
    return user
  }

  decodeToken(token: string): string {
    const payload = this.jwtService.decode(token)
    if (!payload || typeof payload !== 'object' || !payload['email']) {
      throw new UnauthorizedException()
    }
    return payload['email']
  }

  verifyToken(token: string): void {
    try {
      this.jwtService.verify(token, { secret: this.jwtSettings.refreshSecret })
    } catch {
      throw new UnauthorizedException()
    }
  }
}
