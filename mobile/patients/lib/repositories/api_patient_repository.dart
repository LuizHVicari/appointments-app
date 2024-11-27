import 'dart:io';

import 'package:patients/dio.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/repositories/patient_repository_interface.dart';

class ApiPatientRepository implements PatientRepositoryInterface {
  @override
  Future<PatientModel> createPatient(String name, String gender, String phoneNumber, int age) async {
    final response = await dio.post('patients', data: {
      'name': name,
      'phone': phoneNumber,
      'age': age,
      'gender': gender
    });
    if (response.statusCode == HttpStatus.created) {
      return PatientModel.fromJson(response.data);
    }
    logger.d(response.data);
    throw response.data['message'] ?? 'Unknown error';
  }
}