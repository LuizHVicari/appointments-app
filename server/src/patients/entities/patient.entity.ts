import { ApiProperty } from '@nestjs/swagger'
import { User } from 'src/users/entities/user.entity'
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
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
  gender: String

  @ManyToOne(() => User, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user' })
  @ApiProperty({
    type: () => User,
  })
  user: User
}
