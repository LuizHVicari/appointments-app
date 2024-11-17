import 'package:flutter/material.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/patient_model.dart';

class PatientCard extends StatelessWidget {
  final PatientModel patientModel;
  const PatientCard({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(height: 50, width: 50, color: Colors.teal),
                const SizedBox(width: cardItemSeparation),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient's name",
                    ),
                    Text(
                      "Patient's phone",
                    ),
                  ],
                ),
                const SizedBox(width: cardItemSeparation),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient's age",  
                    ),
                    Text(
                      "Patient's gender",
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/patientDetails', 
                arguments: patientModel
              ), 
              icon: Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                )
            )
          ],
        ),
      ),
    );
  }
}