import 'package:flutter/material.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/repositories/api_appointment_repository.dart';
import 'package:patients/repositories/appointment_repository_interface.dart';
import 'package:patients/view_models/show_error_view_model.dart';

class CreateAppointmentViewModel extends ShowErrorViewModel with ChangeNotifier{ 
  TextEditingController placeController = TextEditingController(); 
  TextEditingController detailsController = TextEditingController(); 
  DateTime? appointmentDay;
  TimeOfDay? appointmentTime;
  DateTime? completeDateTime;
  AppointmentRepositoryInterface appointmentRepository = ApiAppointmentRepository();

  void selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: DateTime(2030)
      );
    appointmentDay = date;
    setDateTime();
  }

  void selectTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(), 
      );
    appointmentTime = time;
    setDateTime();
  }

  void setDateTime() {
    if (appointmentDay != null && appointmentTime != null) {
      completeDateTime = DateTime(
        appointmentDay!.year,
        appointmentDay!.month,
        appointmentDay!.day,
        appointmentTime!.hour,
        appointmentTime!.minute,
      );
      notifyListeners();
    }
  }

  void createAppointment(BuildContext context, PatientModel patient) {
    if (placeController.text.isEmpty) {
      showError(context, 'Place must not be empty');
      return;
    }
    if (detailsController.text.isEmpty) {
      showError(context, 'Details must not be empty');
      return;
    }
    if (completeDateTime == null) {
      showError(context, 'Date and time must not be empty');
      return;
    }
    try {
      appointmentRepository.createAppointment(
        dateTime: completeDateTime!, 
        patientId: patient.id!, 
        place: placeController.text,
        details: detailsController.text,
      );
      placeController.text = '';
      detailsController.text = '';
      completeDateTime = null;
      appointmentDay = null;
      appointmentTime = null;
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      showError(context, error.toString());
    }
  }
}