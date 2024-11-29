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
import { ApiCreatedResponse } from '@nestjs/swagger'
import { Request } from 'express'
import { AuthenticationGuard } from 'src/auth/guards/auth.guard'
import { AppointmentsService } from './appointments.service'
import { CreateAppointmentDto } from './dto/create-appointment.dto'
import { UpdateAppointmentDto } from './dto/update-appointment.dto'
import { Appointment } from './entities/appointment.entity'

@UseGuards(AuthenticationGuard)
@Controller('appointments')
export class AppointmentsController {
  constructor(private readonly appointmentsService: AppointmentsService) {}

  @Post()
  @ApiCreatedResponse()
  async create(
    @Req() request: Request,
    @Body() createAppointmentDto: CreateAppointmentDto,
  ): Promise<Appointment> {
    return await this.appointmentsService.create(request, createAppointmentDto)
  }

  @Get()
  async findAll(@Req() request: Request): Promise<Appointment[]> {
    return await this.appointmentsService.findAll(request)
  }

  @Get(':id')
  async findOne(
    @Req() request: Request,
    @Param('id') id: string,
  ): Promise<Appointment> {
    return await this.appointmentsService.findOne(request, id)
  }

  @Patch(':id')
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
  // @ApiNoContentResponse({ type: Appointment })
  async remove(
    @Req() request: Request,
    @Param('id') id: string,
  ): Promise<Appointment> {
    return await this.appointmentsService.remove(request, id)
  }
}
