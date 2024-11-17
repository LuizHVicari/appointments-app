import 'package:flutter/material.dart';
import 'package:patients/components/information_row.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/patient_model.dart';

class PatientDetailsPage extends StatefulWidget {
  final PatientModel patientModel;

  const PatientDetailsPage({super.key, required this.patientModel});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient ${widget.patientModel.patientId} details"),
        actions: [
          IconButton(
            onPressed: () => {}, 
            icon: const Icon(Icons.edit)
          ),
          IconButton(
            onPressed: () => {}, 
            icon: const Icon(Icons.delete)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 200, width: 200, color: Colors.teal),
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationRow(label: 'Name', info: widget.patientModel.name),
                    InformationRow(label: 'Phone', info: widget.patientModel.phoneNumber),
                    InformationRow(label: 'Gender', info: widget.patientModel.gender),
                    InformationRow(label: 'Age', info: widget.patientModel.age.toString()),
                    InformationRow(label: 'Additional Information', info: widget.patientModel.additionalInformation),
                  ],
                ),      
              )
            ],
          ),
        ),
      ),
    );
  }
}