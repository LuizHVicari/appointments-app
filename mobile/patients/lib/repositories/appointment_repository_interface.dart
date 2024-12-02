import 'package:patients/models/appointment_model.dart';

abstract class AppointmentRepositoryInterface {

  Future<List<AppointmentModel>> listAppointments();

  Future<AppointmentModel> retrieveAppointments(String id);

  Future<AppointmentModel> createAppointment({
    required String place, 
    required String details, 
    required DateTime dateTime, 
    required String patientId
    });

  Future<void> deletePatient(String id);

  Future<AppointmentModel> confirmAppointment(String id);

  Future<AppointmentModel> cancelAppointment(String id);

}