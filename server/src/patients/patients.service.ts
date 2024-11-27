import {
  BadRequestException,
  ForbiddenException,
  Injectable,
} from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import { REQUEST_TOKEN_PAYLOAD } from 'src/common/constants'
import { User } from 'src/users/entities/user.entity'
import { QueryFailedError, Repository } from 'typeorm'
import { CreatePatientDto } from './dto/create-patient.dto'
import { UpdatePatientDto } from './dto/update-patient.dto'
import { Patient } from './entities/patient.entity'

@Injectable()
export class PatientsService {
  constructor(
    @InjectRepository(Patient)
    private readonly patientRepository: Repository<Patient>,
  ) {}

  async savePatient(patient: Patient) {
    try {
      return await this.patientRepository.save(patient)
    } catch (error) {
      if (error instanceof QueryFailedError) {
        throw new BadRequestException(error.message)
      }
      throw error
    }
  }

  getUserFromRequest(request) {
    const { user }: { user: User } = request[REQUEST_TOKEN_PAYLOAD]
    return user
  }

  async create(createPatientDto: CreatePatientDto, request: Request) {
    const user = this.getUserFromRequest(request)
    const patient = this.patientRepository.create({
      ...createPatientDto,
      user: user,
    })
    console.log(patient)
    if (!patient) throw new BadRequestException('Could not create patient')
    return await this.savePatient(patient)
  }

  async findAll(request: Request) {
    const user = this.getUserFromRequest(request)
    const patients = await this.patientRepository.findBy({ user: user })

    return patients
  }

  async findOne(id: string, request: Request) {
    const user = this.getUserFromRequest(request)
    console.log(user)
    const patient = await this.patientRepository.findOne({
      where: { id },
      relations: ['user'],
    })
    console.log(patient.user)
    if (patient.user?.id !== user?.id) {
      throw new ForbiddenException('This patient belongs to another user')
    }
    return patient
  }

  update(id: number, updatePatientDto: UpdatePatientDto) {
    return `This action updates a #${id} patient`
  }

  async remove(id: string, request: Request) {
    const patient = await this.findOne(id, request)
    return await this.patientRepository.remove(patient)
  }
}
