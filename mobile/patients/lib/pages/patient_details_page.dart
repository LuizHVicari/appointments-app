import 'package:flutter/material.dart';
import 'package:patients/components/information_row.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/view_models/patient_details_view_model.dart';
import 'package:provider/provider.dart';

class PatientDetailsPage extends StatelessWidget {
  final PatientModel patientModel;

  const PatientDetailsPage({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient ${patientModel.name} details"),
        actions: [
          IconButton(
            onPressed: () async => await Provider
              .of<PatientDetailsViewModel>(context, listen: false).deletePatient(context, patientModel) , 
            icon: const Icon(Icons.delete)
          ),
          IconButton(
            onPressed: () => {}, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Container(height: 200, width: 200, color: Colors.teal)),
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InformationRow(label: 'Name', info: patientModel.name ?? 'No name for this patient'),
                      InformationRow(label: 'Phone', info: patientModel.phone ?? 'No phone for this patient'),
                      InformationRow(label: 'Gender', info: patientModel.gender ?? 'No gender for this patient'),
                      InformationRow(label: 'Age', info: patientModel.age.toString()),
                    ],
                  ),      
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}