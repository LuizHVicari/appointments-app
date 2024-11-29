import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import extractUserFromRequest from 'src/common/utils/userExtractor'
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

  async savePatient(patient: Patient): Promise<Patient> {
    try {
      return await this.patientRepository.save(patient)
    } catch (error) {
      if (error instanceof QueryFailedError) {
        throw new BadRequestException()
      }
      throw error
    }
  }

  async create(
    createPatientDto: CreatePatientDto,
    request: Request,
  ): Promise<Patient> {
    const user = extractUserFromRequest(request)
    const patient = this.constructPatient(createPatientDto, user)
    return await this.savePatient(patient)
  }

  private constructPatient(
    createPatientDto: CreatePatientDto,
    user: User,
  ): Patient {
    return this.patientRepository.create({
      ...createPatientDto,
      user,
    })
  }

  async findAll(request: Request): Promise<Patient[]> {
    const user = extractUserFromRequest(request)
    const patients = await this.patientRepository.find({
      where: { user: user },
      relations: { user: true },
    })
    return patients
  }

  async findOne(id: string, request: Request): Promise<Patient> {
    const user = extractUserFromRequest(request)
    return await this.findPatientByUserAndId(id, user)
  }

  private async findPatientByUserAndId(
    id: string,
    user: User,
  ): Promise<Patient> {
    const patient = await this.patientRepository.findOne({
      where: { id, user },
      relations: { user: true },
    })
    if (!patient) {
      throw new NotFoundException()
    }
    return patient
  }

  async update(
    id: string,
    updatePatientDto: UpdatePatientDto,
    request: Request,
  ): Promise<Patient> {
    const patient = await this.findOne(id, request)
    const updatedPatient = {
      ...patient,
      ...updatePatientDto,
    }
    return await this.savePatient(updatedPatient)
  }

  async remove(id: string, request: Request): Promise<Patient> {
    const patient = await this.findOne(id, request)
    return await this.patientRepository.remove(patient)
  }
}
