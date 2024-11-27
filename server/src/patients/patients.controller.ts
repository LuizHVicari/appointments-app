import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common'
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiForbiddenResponse,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger'
import { Request } from 'express'
import { AuthenticationGuard } from 'src/auth/guards/auth.guard'
import { CreatePatientDto } from './dto/create-patient.dto'
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
  create(@Body() createPatientDto: CreatePatientDto, @Req() request: Request) {
    return this.patientsService.create(createPatientDto, request)
  }

  @Get()
  @ApiOkResponse({ type: [Patient] })
  @ApiUnauthorizedResponse()
  findAll(@Req() request: Request) {
    return this.patientsService.findAll(request)
  }

  @Get(':id')
  @ApiOkResponse({ type: Patient, description: 'Retrieves a patient by id' })
  @ApiUnauthorizedResponse()
  @ApiForbiddenResponse()
  findOne(@Param('id') id: string, @Req() request: Request) {
    return this.patientsService.findOne(id, request)
  }

  // @Patch(':id')
  // @HttpCode(HttpStatus.CREATED)
  // update(@Param('id') id: string, @Body() updatePatientDto: UpdatePatientDto) {
  //   return this.patientsService.update(+id, updatePatientDto)
  // }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse({
    type: Patient,
    description: 'Deletes a patient from the database',
  })
  @ApiUnauthorizedResponse()
  @ApiForbiddenResponse()
  remove(@Param('id') id: string, @Req() request: Request) {
    return this.patientsService.remove(id, request)
  }
}
