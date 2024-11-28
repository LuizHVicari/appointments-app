import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Req,
} from '@nestjs/common'
import { Request } from 'express'
import { AppointmentsService } from './appointments.service'
import { CreateAppointmentDto } from './dto/create-appointment.dto'
import { UpdateAppointmentDto } from './dto/update-appointment.dto'

@Controller('appointments')
export class AppointmentsController {
  constructor(private readonly appointmentsService: AppointmentsService) {}

  @Post()
  create(
    @Req() request: Request,
    @Body() createAppointmentDto: CreateAppointmentDto,
  ) {
    return this.appointmentsService.create(request, createAppointmentDto)
  }

  @Get()
  findAll() {
    return this.appointmentsService.findAll()
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.appointmentsService.findOne(+id)
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateAppointmentDto: UpdateAppointmentDto,
  ) {
    return this.appointmentsService.update(+id, updateAppointmentDto)
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.appointmentsService.remove(+id)
  }
}

