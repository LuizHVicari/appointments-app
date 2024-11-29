import { ApiProperty } from '@nestjs/swagger'
import { Appointment } from 'src/appointments/entities/appointment.entity'
import { User } from 'src/users/entities/user.entity'
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm'

@Entity()
export class Patient {
  @PrimaryGeneratedColumn('uuid')
  @ApiProperty()
  id: string

  @Column()
  @ApiProperty()
  name: string

  @Column()
  @ApiProperty()
  phone: string

  @Column()
  @ApiProperty()
  age: number

  @Column()
  @ApiProperty()
  gender: string

  @ManyToOne(() => User, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user' })
  @ApiProperty({
    type: () => User,
  })
  user: User

  @OneToMany(() => Appointment, (appointment) => appointment.patient)
  appointments: Appointment[]
}
