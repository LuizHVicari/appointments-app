import 'package:flutter_test/flutter_test.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/models/user_model.dart';

void main() {
  group('AppointmentModel Tests', () {
    final userModel = UserModel(id: 'user1', name: 'Dr. Smith');
    final patientModel = PatientModel(id: 'patient1', name: 'John Doe', age: 30);
    final appointmentDate = DateTime(2024, 12, 4, 14, 30);

    test('fromJson should correctly create AppointmentModel from JSON', () {
      final appointmentJson = {
        'id': 'appointment1',
        'user': {
          'id': 'user1',
          'name': 'Dr. Smith',
        },
        'patient': {
          'id': 'patient1',
          'name': 'John Doe',
          'age': 30,
        },
        'date': '2024-12-04T14:30:00.000',
        'place': 'Clinic A',
        'details': 'Follow-up appointment',
        'confirmed': true,
      };

      final appointment = AppointmentModel.fromJson(appointmentJson);

      expect(appointment.id, 'appointment1');
      expect(appointment.user?.id, 'user1');
      expect(appointment.patient?.name, 'John Doe');
      expect(appointment.date, appointmentDate);
      expect(appointment.place, 'Clinic A');
      expect(appointment.details, 'Follow-up appointment');
      expect(appointment.confirmed, true);
    });

    test('toJson should correctly convert AppointmentModel to JSON', () {
      final appointment = AppointmentModel(
        id: 'appointment1',
        user: userModel,
        patient: patientModel,
        date: appointmentDate,
        place: 'Clinic A',
        details: 'Follow-up appointment',
        confirmed: true,
      );

      final appointmentJson = appointment.toJson();

      expect(appointmentJson['id'], 'appointment1');
      expect(appointmentJson['user']['id'], 'user1');
      expect(appointmentJson['patient']['name'], 'John Doe');
      expect(appointmentJson['date'], appointmentDate.toString());
      expect(appointmentJson['place'], 'Clinic A');
      expect(appointmentJson['details'], 'Follow-up appointment');
      expect(appointmentJson['confirmed'], true);
    });
  });
}
