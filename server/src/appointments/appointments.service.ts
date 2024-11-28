import { Injectable } from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import extractUserFromRequest from 'src/common/utils/userExtractor'
import { Repository } from 'typeorm'
import { CreateAppointmentDto } from './dto/create-appointment.dto'
import { UpdateAppointmentDto } from './dto/update-appointment.dto'
import { Appointment } from './entities/appointment.entity'

@Injectable()
export class AppointmentsService {
  constructor(
    @InjectRepository(Appointment)
    private readonly appointmentRepository: Repository<Appointment>,
  ) {}

  async create(
    request: Request,
    createAppointmentDto: CreateAppointmentDto,
  ): Promise<Appointment> {
    const user = extractUserFromRequest(request)
    const appointment = this.appointmentRepository.create({
      ...createAppointmentDto,
      user,
    })
    return await this.appointmentRepository.save(appointment)
  }

  findAll() {
    return `This action returns all appointments`
  }

  findOne(id: number) {
    return `This action returns a #${id} appointment`
  }

  update(id: number, updateAppointmentDto: UpdateAppointmentDto) {
    return `This action updates a #${id} appointment`
  }

  remove(id: number) {
    return `This action removes a #${id} appointment`
  }
}
