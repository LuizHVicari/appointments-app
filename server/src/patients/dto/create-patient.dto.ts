import { ApiProperty } from '@nestjs/swagger'
import {
  IsIn,
  IsInt,
  IsPhoneNumber,
  IsPositive,
  IsString,
} from 'class-validator'

const genders = ['Male', 'Female', 'Other']

export class CreatePatientDto {
  @IsString()
  @ApiProperty()
  name: string

  @IsString()
  @IsPhoneNumber('BR')
  @ApiProperty()
  phone: string

  @IsPositive()
  @IsInt()
  @ApiProperty()
  age: number

  @IsString()
  @IsIn(genders)
  @ApiProperty()
  gender: String
}
