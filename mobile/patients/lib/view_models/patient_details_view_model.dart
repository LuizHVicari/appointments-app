import 'dart:io';
import 'package:flutter/material.dart';
import 'package:patients/dio.dart';
import 'package:patients/models/patient_model.dart';

class PatientDetailsViewModel extends ChangeNotifier {
  
  Future<void> deletePatient(BuildContext context, PatientModel patient) async {
    try {
      final response = await dio.delete('patients/${patient.id}');

      if (response.statusCode != HttpStatus.noContent) {
        showMessageDialog(context, response.statusMessage.toString());
        return;
      }

      showMessageDialog(context, 'Patient deleted successfully');
      Navigator.of(context).popAndPushNamed('/home');

    } catch (error) {
      showMessageDialog(context, error.toString());
    } 
  }
  
  void showMessageDialog(BuildContext context, String text) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(content: Text(text))
    );
  }
}
