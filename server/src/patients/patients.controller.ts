import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common'
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger'
import { Request } from 'express'
import { AuthenticationGuard } from 'src/auth/guards/auth.guard'
import { CreatePatientDto } from './dto/create-patient.dto'
import { UpdatePatientDto } from './dto/update-patient.dto'
import { Patient } from './entities/patient.entity'
import { PatientsService } from './patients.service'

@UseGuards(AuthenticationGuard)
@ApiBearerAuth()
@Controller('patients')
export class PatientsController {
  constructor(private readonly patientsService: PatientsService) {}

  @Post()
  @ApiCreatedResponse({ type: Patient, description: 'Creates a new patient' })
  @ApiUnauthorizedResponse()
  @ApiBadRequestResponse()
  async create(
    @Body() createPatientDto: CreatePatientDto,
    @Req() request: Request,
  ): Promise<Patient> {
    return await this.patientsService.create(createPatientDto, request)
  }

  @Get()
  @ApiOkResponse({ type: [Patient], description: "Lists all user's patients" })
  @ApiUnauthorizedResponse()
  async findAll(@Req() request: Request): Promise<Patient[]> {
    return await this.patientsService.findAll(request)
  }

  @Get(':id')
  @ApiOkResponse({ type: Patient, description: 'Retrieves a patient by id' })
  @ApiUnauthorizedResponse()
  @ApiNotFoundResponse()
  async findOne(
    @Param('id') id: string,
    @Req() request: Request,
  ): Promise<Patient> {
    return await this.patientsService.findOne(id, request)
  }

  @Patch(':id')
  @HttpCode(HttpStatus.CREATED)
  @ApiCreatedResponse({ type: Patient, description: 'Updates patient data' })
  @ApiUnauthorizedResponse()
  @ApiNotFoundResponse()
  async update(
    @Req() request: Request,
    @Param('id') id: string,
    @Body() updatePatientDto: UpdatePatientDto,
  ): Promise<Patient> {
    return await this.patientsService.update(id, updatePatientDto, request)
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiUnauthorizedResponse()
  @ApiNotFoundResponse()
  async remove(
    @Param('id') id: string,
    @Req() request: Request,
  ): Promise<void> {
    await this.patientsService.remove(id, request)
  }
}
