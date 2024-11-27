import 'package:flutter/material.dart';
import 'package:patients/common/extensions.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/patient_model.dart';

class PatientCard extends StatelessWidget {
  final PatientModel patient;
  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardText(context: context, text: patient.name ?? '', fontWeight: FontWeight.bold),
                    cardText(context: context, text: patient.phone ?? '')
                  ],
                ),
                const SizedBox(width: cardItemSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardText(context: context, text: patient.age.toString()),
                    patient.gender == 'male' ? const Icon(Icons.male) : patient.gender == 'female' ? const Icon(Icons.female) : const Icon(Icons.person),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/patientDetails', 
                arguments: patient
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

  Widget cardText({
    required BuildContext context,
    required String text, 
    double fontSize = fontMedium, 
    FontWeight fontWeight =  FontWeight.normal
  }) {
    return Text(
      text.capitalize(),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontWeight: fontWeight,
        fontSize: fontSize
      ),
    );

  }
}