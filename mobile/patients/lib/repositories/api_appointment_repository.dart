import 'dart:io';

import 'package:patients/dio.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/repositories/appointment_repository_interface.dart';

class ApiAppointmentRepository implements AppointmentRepositoryInterface{

  @override
  Future<List<AppointmentModel>> listAppointments() async {
    final response = await dio.get('appointments');
    if (response.statusCode == HttpStatus.ok) {
      List<AppointmentModel> appointments = (response.data as List).map((item) {
        return AppointmentModel.fromJson(item);
      }).toList();

      return appointments;
    }
    throw response.data['message'] ?? 'Unknown Error';
    
  }
  
  @override
  Future<AppointmentModel> retrieveAppointments(String id) async {
    final response = await dio.get('appointments/$id');
    if (response.statusCode == HttpStatus.ok) {
      return AppointmentModel.fromJson(response.data);
    }
    throw response.data['message'] ?? 'Unknown Error';
  }
  
  @override
  Future<void> deletePatient(String id) async {
    final response = await dio.delete('appointments/$id');
    if (response.statusCode != HttpStatus.noContent) {
      throw response.data['message'] ?? 'Unknown error';
    }
  }
  
  @override
  Future<AppointmentModel> createAppointment({
    required String place, 
    required String details, 
    required DateTime dateTime, 
    required String patientId
    }) async {
    final response = await dio.post('appointments', data: {
      'patientId': patientId,
      'place': place,
      'details': details,
      'date': dateTime.toIso8601String(),
      'confirmed': false
    });
    if (response.statusCode == HttpStatus.created) {
      return AppointmentModel.fromJson(response.data);
    }
    throw response.data['message'] ?? 'Unknown Error';

  }
  
  @override
  Future<AppointmentModel> confirmAppointment(String id) async {
    final response = await dio.patch('appointments/$id', data: {'confirmed': true});

    if (response.statusCode == HttpStatus.created) {
      return AppointmentModel.fromJson(response.data);
    }  
    throw response.data['message'] ?? 'Unknown error';
  }

  @override
  Future<AppointmentModel> cancelAppointment(String id) async {
    final response = await dio.patch('appointments/$id', data: {'confirmed': false});

    if (response.statusCode == HttpStatus.created) {
      return AppointmentModel.fromJson(response.data);
    }  
    throw response.data['message'] ?? 'Unknown error';
  }
}