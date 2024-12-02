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
     
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardText(context: context, text: patient.name ?? '', fontWeight: FontWeight.bold, sizeMultiplication: 3),
                    cardText(context: context, text: patient.phone ?? '', sizeMultiplication: 3)
                  ],
                ),
                const SizedBox(width: cardItemSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardText(context: context, text: patient.age.toString(), sizeMultiplication: 1),
                    patient.gender == 'Male' 
                      ? Icon(Icons.male, color: Theme.of(context).colorScheme.onPrimaryContainer,) 
                      : patient.gender == 'female' 
                        ? Icon(Icons.female, color: Theme.of(context).colorScheme.onPrimaryContainer,) 
                        :  Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimaryContainer,),
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
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
    int? sizeMultiplication = 2,
    double fontSize = fontMedium, 
    FontWeight fontWeight =  FontWeight.normal
  }) {
    var multiplier = sizeMultiplication ?? 2;
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 8) * multiplier,
      child: Text(
        text.capitalize(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: fontWeight,
          fontSize: fontSize
        ),
      ),
    );

  }
}