import { Module } from '@nestjs/common'
import { ConfigModule } from '@nestjs/config'
import { JwtModule } from '@nestjs/jwt'
import { TypeOrmModule } from '@nestjs/typeorm'
import jwtConfig from 'src/auth/config/jwt.config'
import { PatientsModule } from 'src/patients/patients.module'
import { User } from 'src/users/entities/user.entity'
import { AppointmentsController } from './appointments.controller'
import { AppointmentsService } from './appointments.service'
import { Appointment } from './entities/appointment.entity'

@Module({
  imports: [
    TypeOrmModule.forFeature([Appointment, User]),
    ConfigModule.forFeature(jwtConfig),
    JwtModule.registerAsync(jwtConfig.asProvider()),
    PatientsModule,
  ],
  controllers: [AppointmentsController],
  providers: [AppointmentsService],
})
export class AppointmentsModule {}
