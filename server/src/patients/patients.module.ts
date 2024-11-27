import { Module } from '@nestjs/common'
import { ConfigModule } from '@nestjs/config'
import { JwtModule } from '@nestjs/jwt'
import { TypeOrmModule } from '@nestjs/typeorm'
import jwtConfig from 'src/auth/config/jwt.config'
import { User } from 'src/users/entities/user.entity'
import { Patient } from './entities/patient.entity'
import { PatientsController } from './patients.controller'
import { PatientsService } from './patients.service'

@Module({
  controllers: [PatientsController],
  providers: [PatientsService],
  imports: [
    TypeOrmModule.forFeature([Patient, User]),
    ConfigModule.forFeature(jwtConfig),
    JwtModule.registerAsync(jwtConfig.asProvider()),
  ],
})
export class PatientsModule {}
