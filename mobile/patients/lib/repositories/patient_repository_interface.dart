import 'package:patients/models/patient_model.dart';

abstract class PatientRepositoryInterface {
  Future<PatientModel> createPatient(String name, String gender, String phoneNumber, int age);
}