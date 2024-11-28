import { ApiProperty } from '@nestjs/swagger'
import { Patient } from 'src/patients/entities/patient.entity'

export class CreateAppointmentDto {
  @ApiProperty({ type: () => Patient })
  patient: Patient

  @ApiProperty()
  date: Date

  @ApiProperty()
  place: string

  @ApiProperty()
  details?: string
}

