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
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger'
import { Request } from 'express'
import { AuthenticationGuard } from 'src/auth/guards/auth.guard'
import { AppointmentsService } from './appointments.service'
import { CreateAppointmentDto } from './dto/create-appointment.dto'
import { UpdateAppointmentDto } from './dto/update-appointment.dto'
import { Appointment } from './entities/appointment.entity'

@UseGuards(AuthenticationGuard)
@ApiBearerAuth()
@Controller('appointments')
export class AppointmentsController {
  constructor(private readonly appointmentsService: AppointmentsService) {}

  @Post()
  @ApiCreatedResponse({
    type: Appointment,
    description: 'Creates a new appointment',
  })
  @ApiUnauthorizedResponse()
  async create(
    @Req() request: Request,
    @Body() createAppointmentDto: CreateAppointmentDto,
  ): Promise<Appointment> {
    return await this.appointmentsService.create(request, createAppointmentDto)
  }

  @Get()
  @ApiOkResponse({
    type: [Appointment],
    description: 'Lists all users appointments',
  })
  @ApiUnauthorizedResponse()
  async findAll(@Req() request: Request): Promise<Appointment[]> {
    return await this.appointmentsService.findAll(request)
  }

  @Get(':id')
  @ApiOkResponse({
    type: Appointment,
    description: 'Retrieves an appointment from id',
  })
  @ApiNotFoundResponse()
  @ApiUnauthorizedResponse()
  async findOne(
    @Req() request: Request,
    @Param('id') id: string,
  ): Promise<Appointment> {
    return await this.appointmentsService.findOne(request, id)
  }

  @Patch(':id')
  @HttpCode(HttpStatus.CREATED)
  @ApiCreatedResponse({
    type: Appointment,
    description: 'Updates the data of an appointment',
  })
  @ApiNotFoundResponse()
  @ApiUnauthorizedResponse()
  async update(
    @Req() request: Request,
    @Param('id') id: string,
    @Body() updateAppointmentDto: UpdateAppointmentDto,
  ): Promise<Appointment> {
    return await this.appointmentsService.update(
      request,
      id,
      updateAppointmentDto,
    )
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiNoContentResponse()
  @ApiNotFoundResponse()
  @ApiUnauthorizedResponse()
  async remove(
    @Req() request: Request,
    @Param('id') id: string,
  ): Promise<void> {
    await this.appointmentsService.remove(request, id)
  }
}
