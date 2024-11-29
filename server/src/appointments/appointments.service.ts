import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import extractUserFromRequest from 'src/common/utils/userExtractor'
import { Patient } from 'src/patients/entities/patient.entity'
import { PatientsService } from 'src/patients/patients.service'
import { User } from 'src/users/entities/user.entity'
import { Repository } from 'typeorm'
import { CreateAppointmentDto } from './dto/create-appointment.dto'
import { UpdateAppointmentDto } from './dto/update-appointment.dto'
import { Appointment } from './entities/appointment.entity'

@Injectable()
export class AppointmentsService {
  constructor(
    @InjectRepository(Appointment)
    private readonly appointmentRepository: Repository<Appointment>,
    private readonly patientsService: PatientsService,
  ) {}

  async create(
    request: Request,
    createAppointmentDto: CreateAppointmentDto,
  ): Promise<Appointment> {
    const user = extractUserFromRequest(request)
    const patient = await this.patientsService.findOne(
      createAppointmentDto.patientId,
      request,
    )
    const appointment = this.constructAppointment(
      createAppointmentDto,
      user,
      patient,
    )
    return await this.appointmentRepository.save(appointment)
  }

  private constructAppointment(
    createAppointmentDto: CreateAppointmentDto,
    user: User,
    patient: Patient,
  ): Appointment {
    try {
      const appointment = this.appointmentRepository.create({
        ...createAppointmentDto,
        user,
        patient,
      })
      return appointment
    } catch {
      throw new BadRequestException()
    }
  }

  async findAll(request: Request): Promise<Appointment[]> {
    const user = extractUserFromRequest(request)
    const appointments = await this.appointmentRepository.find({
      where: { user },
      relations: { patient: true, user: true },
    })
    return appointments
  }

  async findOne(request: Request, id: string): Promise<Appointment> {
    const user = extractUserFromRequest(request)
    const appointment = await this.findAppointmentByIdAndUser(user, id)
    return appointment
  }

  private async findAppointmentByIdAndUser(
    user: User,
    id: string,
  ): Promise<Appointment> {
    const appointment = await this.appointmentRepository.findOne({
      where: { id, user },
      relations: { user: true, patient: true },
    })
    if (!appointment) {
      throw new NotFoundException()
    }
    return appointment
  }

  async update(
    request: Request,
    id: string,
    updateAppointmentDto: UpdateAppointmentDto,
  ): Promise<Appointment> {
    const appointment = await this.findOne(request, id)
    const updatedAppointment = {
      ...appointment,
      ...updateAppointmentDto,
    }
    return await this.appointmentRepository.save(updatedAppointment)
  }

  async remove(request: Request, id: string): Promise<Appointment> {
    const appointment = await this.findOne(request, id)
    await this.appointmentRepository.remove(appointment)
    return appointment
  }
}
