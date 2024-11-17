import 'package:flutter/material.dart';
import 'package:patients/components/patient_card.dart';
import 'package:patients/models/patient_model.dart';

class PatientsList extends StatelessWidget {
  PatientsList({super.key});

  final PatientModel demoPatientModel = PatientModel(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget accumsan urna, ac varius velit. Nunc ac nisl non augue condimentum rutrum. Sed viverra ornare orci, sed pulvinar elit hendrerit egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse viverra varius arcu, at faucibus arcu consequat ac. Integer convallis in odio quis dictum. Sed sollicitudin velit et nisi eleifend pharetra. Morbi ut feugiat ipsum, in vulputate purus. Mauris congue eros sit amet massa venenatis vulputate.', 
    patientId: 'a', 
    name: 'Luiz', 
    gender: 'Male', 
    phoneNumber: '(46) 99971-9906', 
    age: 23
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        PatientCard(patientModel: demoPatientModel),
        PatientCard(patientModel: demoPatientModel),
        PatientCard(patientModel: demoPatientModel),
        PatientCard(patientModel: demoPatientModel),
        PatientCard(patientModel: demoPatientModel),
      ],
    );
  }
}