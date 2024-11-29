import { ApiProperty } from '@nestjs/swagger'
import { Patient } from 'src/patients/entities/patient.entity'
import { User } from 'src/users/entities/user.entity'
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm'

@Entity()
export class Appointment {
  @PrimaryGeneratedColumn('uuid')
  @ApiProperty()
  id: string

  @ManyToOne(() => User, (user) => user.appointments, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user' })
  @ApiProperty({ type: () => User })
  user: User

  @ManyToOne(() => Patient, (patient) => patient.appointments, {
    onDelete: 'CASCADE',
  })
  @JoinColumn({ name: 'patient' })
  @ApiProperty({ type: () => Patient })
  patient: Patient

  @Column({ type: 'timestamptz' })
  @ApiProperty()
  date?: Date

  @Column()
  @ApiProperty()
  place?: string

  @Column()
  @ApiProperty()
  details?: string
}
