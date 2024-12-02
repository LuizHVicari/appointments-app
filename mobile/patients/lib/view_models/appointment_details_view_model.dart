import 'package:flutter/material.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/repositories/api_appointment_repository.dart';
import 'package:patients/repositories/appointment_repository_interface.dart';

class AppointmentDetailsViewModel extends ChangeNotifier {
  final AppointmentRepositoryInterface _appointmentRepository =
      ApiAppointmentRepository();

  Future<void> deleteAppointment(BuildContext context, String id) async {
    try {
      _appointmentRepository.deletePatient(id);
    } catch (error) {
      showErrorDialog(context, error.toString());
    } finally {
      Navigator.of(context).popAndPushNamed('/home');
    }
  }

  Future<void> changeAppointmentStatus(BuildContext context, AppointmentModel appointment) async {
    
    try {
      if (appointment.confirmed == true) {
        await _appointmentRepository.cancelAppointment(appointment.id!);
      } else {
        await _appointmentRepository.confirmAppointment(appointment.id!);
      }
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      showErrorDialog(context, error.toString());
    } 
  }

  void showErrorDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text(text)));
  }
}
