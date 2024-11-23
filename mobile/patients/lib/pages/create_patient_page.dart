import 'package:flutter/material.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/view_models/create_patient_view_model.dart';

class CreatePatientPage extends StatelessWidget {
  CreatePatientPage({super.key});

  final _viewModel = CreatePatientViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(pagePadding, 50, pagePadding, pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Patient's informations",
              style: TextStyle(fontSize: fontMedium),  
            ),
            DefaultInputText(
              label: 'Name', 
              textController: _viewModel.nameController
            ),
            const SizedBox(height: cardItemSeparation),
            DefaultInputText(
              label: 'Phone', 
              textController: _viewModel.nameController
            ),
            const SizedBox(height: cardItemSeparation),
            DefaultInputText(
              label: 'Age', 
              textController: _viewModel.nameController
            ),
            const SizedBox(height: cardItemSeparation),
            DefaultInputText(
              label: 'Gender', 
              textController: _viewModel.nameController
            ),
            const SizedBox(height: cardItemSeparation),
            DefaultButton(
              buttonText: 'Add Picture', 
              onPressed: () => {},
              width: 150,
            ),
            DefaultButton(
              buttonText: 'Confirm', 
              onPressed: () => {},
              width: 150,
            )
             
          ],
        ),
      ),
    );
  }
}