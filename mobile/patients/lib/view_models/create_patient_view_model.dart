import 'package:flutter/material.dart';
import 'package:patients/constants/genders.dart';
import 'package:patients/logger.dart';
import 'package:patients/repositories/api_patient_repository.dart';
import 'package:patients/repositories/patient_repository_interface.dart';

class CreatePatientViewModel extends ChangeNotifier {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  String _gender = genderMale;

  final PatientRepositoryInterface patientRepository = ApiPatientRepository();

  Future<void> createPatient(BuildContext context) async {
    if (nameController.text.isEmpty) {
      showErrorDialog(context, 'Name cannot be empty');
      return; 
    }
    if (phoneController.text.isEmpty) {
      showErrorDialog(context, 'Phone cannot be empty');
      return; 
    }
    if (ageController.text.isEmpty) {
      showErrorDialog(context, 'Age cannot be empty');
      return; 
    }

    try {
      int? age = int.tryParse(ageController.text);
      final patient = patientRepository.createPatient(
        nameController.text, 
        _gender, 
        phoneController.text, 
        age ?? 0);
        logger.i(patient);
        Navigator.popAndPushNamed(context, '/home');
    } catch (error) {
      showErrorDialog(context, error.toString());
    }
  }

  void setGender({required BuildContext context, required String gender}) {
    logger.d('mudou para $gender');
    if ([genderMale, genderFemale, genderOther].contains(gender)) {
    _gender = gender;
    notifyListeners(); 
    return;
  }
    showErrorDialog(context, 'Invalid gender option');
  }

  String getGender() {
    return _gender;
  }

  void showErrorDialog(BuildContext context, String text) {
    showDialog(
        context: context, 
        builder: (context) => AlertDialog(content: Text(text))
      );
  }

}