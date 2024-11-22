import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsStrongPassword } from "class-validator";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class User {

  @PrimaryGeneratedColumn('uuid')
  @ApiProperty()
  id: string

  @Column({unique: true})
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

}
