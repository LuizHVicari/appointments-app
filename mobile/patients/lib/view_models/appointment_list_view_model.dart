import 'package:flutter/material.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/repositories/api_appointment_repository.dart';
import 'package:patients/repositories/appointment_repository_interface.dart';

class AppointmentListViewModel extends ChangeNotifier {
  final AppointmentRepositoryInterface _appointmentRepository = ApiAppointmentRepository();
  bool isLoading = false;
  List<AppointmentModel?> appointments = [];

  Future<void> listAppointments(BuildContext context) async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    Future.microtask(() {
      notifyListeners();
    });

    try {
      appointments = await _appointmentRepository.listAppointments();

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