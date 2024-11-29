import { ApiProperty } from '@nestjs/swagger'
import { IsEmail, IsStrongPassword } from 'class-validator'
import { Appointment } from 'src/appointments/entities/appointment.entity'
import { Patient } from 'src/patients/entities/patient.entity'
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm'

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  @ApiProperty()
  id: string

  @Column({ unique: true })
  @IsEmail()
  @ApiProperty()
  email: string

  @Column()
  @IsStrongPassword()
  @ApiProperty()
  password: string

  @Column()
  @ApiProperty()
  name: string

  @OneToMany(() => Patient, (patient) => patient.user)
  patients: Patient[]

  @OneToMany(() => Appointment, (appointment) => appointment.user)
  appointments: Appointment[]
}
