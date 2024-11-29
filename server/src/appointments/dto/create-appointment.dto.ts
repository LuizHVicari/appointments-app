import { ApiProperty } from '@nestjs/swagger'
import { IsDateString, IsString, IsUUID } from 'class-validator'

export class CreateAppointmentDto {
  @ApiProperty()
  @IsUUID()
  patientId: string

  @ApiProperty()
  @IsDateString()
  date: Date

  @ApiProperty()
  @IsString()
  place?: string

  @ApiProperty()
  @IsString()
  details?: string
}
