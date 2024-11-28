import { Module } from '@nestjs/common'
import { ConfigModule, ConfigType } from '@nestjs/config'
import { JwtModule } from '@nestjs/jwt'
import { PassportModule } from '@nestjs/passport'
import { TypeOrmModule } from '@nestjs/typeorm'
import { User } from 'src/users/entities/user.entity'
import { UsersService } from 'src/users/users.service'
import { AuthController } from './auth.controller'
import { AuthService } from './auth.service'
import jwtConfig from './config/jwt.config'
import { BCryptService } from './hashing/bcrypt.service'
import { HashingServiceProtocol } from './hashing/hashing.service'
import { JwtStrategy } from './strategies/jwt.strategy'

@Module({
  providers: [
    AuthService,
    UsersService,
    JwtStrategy,
    {
      provide: HashingServiceProtocol,
      useClass: BCryptService,
    },
  ],
  controllers: [AuthController],
  imports: [
    TypeOrmModule.forFeature([User]),
    PassportModule,
    ConfigModule.forFeature(jwtConfig),
    JwtModule.registerAsync({
      imports: [ConfigModule.forFeature(jwtConfig)],
      inject: [jwtConfig.KEY],
      useFactory: async (jwtSettings: ConfigType<typeof jwtConfig>) => {
        return {
          secret: jwtSettings.secret,
          signOptions: {
            expiresIn: jwtSettings.expiresIn,
          },
        }
      },
    }),
  ],
  exports: [HashingServiceProtocol],
})
export class AuthModule {}

