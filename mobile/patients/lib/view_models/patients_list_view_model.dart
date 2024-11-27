import 'dart:io';
import 'package:flutter/material.dart';
import 'package:patients/dio.dart';
import 'package:patients/models/patient_model.dart';

class PatientsListViewModel extends ChangeNotifier {
  List<PatientModel?> patients = [];
  bool isLoading = false;

  Future<void> listPatients(BuildContext context) async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    Future.microtask(() {
      notifyListeners();
    });

    try {
      final response = await dio.get('patients');

      if (response.statusCode == HttpStatus.ok) {
        patients = (response.data as List).map((item) {
          return PatientModel.fromJson(item);
        }).toList();
      } else {
        showErrorDialog(context, response.statusMessage.toString());
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  void showErrorDialog(BuildContext context, String text) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(content: Text(text))
    );
  }
}
