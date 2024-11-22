import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { ConfigModule } from '@nestjs/config';
import jwtConfig from 'src/auth/config/jwt.config';
import { JwtModule } from '@nestjs/jwt';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [UsersController],
  providers: [UsersService],
  imports: [
    TypeOrmModule.forFeature([User]),
    ConfigModule.forFeature(jwtConfig),
    JwtModule.registerAsync(jwtConfig.asProvider()),
    AuthModule
  ]
})
export class UsersModule {}
