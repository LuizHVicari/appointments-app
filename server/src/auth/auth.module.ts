import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/users/entities/user.entity';
import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';
import { JwtStrategy } from './strategies/jwt.strategy';
import { HashingServiceProtocol } from './hashing/hashing.service';
import { BCryptService } from './hashing/bcrypt.service';
import { ConfigModule, ConfigType } from '@nestjs/config';
import jwtConfig from './config/jwt.config';

@Module({
  providers: [
    AuthService, 
    UsersService, 
    JwtStrategy,
    {
      provide: HashingServiceProtocol,
      useClass: BCryptService
    }
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
            expiresIn: jwtSettings.expiresIn
          }
        }
      }
    }),
  ],
  exports: [HashingServiceProtocol]
})
export class AuthModule {}
