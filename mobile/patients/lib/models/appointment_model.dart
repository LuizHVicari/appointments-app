import 'package:patients/models/patient_model.dart';

class AppointmentModel {

  String appointmentId;
  PatientModel patient;
  DateTime schedule;
  String place;
  bool attended;
  bool confirmed;
  String? details;

  AppointmentModel({
    required this.appointmentId,
    required this.patient, 
    required this.schedule, 
    required this.place, 
    required this.attended, 
    required this.confirmed,
    this.details
  });

}