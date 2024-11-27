import 'package:flutter/material.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/genders.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/view_models/create_patient_view_model.dart';

class CreatePatientPage extends StatefulWidget {
  const CreatePatientPage({super.key});

  @override
  State<CreatePatientPage> createState() => _CreatePatientPageState();
}

class _CreatePatientPageState extends State<CreatePatientPage> {
  final _viewModel = CreatePatientViewModel();

  final _genderOptions = [genderMale, genderFemale, genderOther];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Patient'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        elevation: 5,
        shadowColor: Theme.of(context).colorScheme.surfaceBright,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(pagePadding, 50, pagePadding, pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Patient's informations",
                  style: TextStyle(fontSize: fontMedium, fontWeight: FontWeight.bold),  
                ),
                const SizedBox(height: pagePadding),
                DefaultInputText(
                  label: 'Name', 
                  textController: _viewModel.nameController
                ),
                const SizedBox(height: cardItemSeparation),
                DefaultInputText(
                  label: 'Phone', 
                  textController: _viewModel.phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: cardItemSeparation),
                DefaultInputText(
                  label: 'Age', 
                  textController: _viewModel.ageController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: cardItemSeparation),
                ButtonTheme(
                  alignedDropdown: true,
                  padding: const EdgeInsets.all(0),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      // isDense: true,
                      dropdownColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      value: _viewModel.getGender(),
                      items: _genderOptions.map((String gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                          
                        );
                      }).toList(),
                      onChanged: (String? value) { 
                        if (value != null) {
                          _viewModel.setGender(context: context, gender: value);
                          setState(() {});
                        }
                      },
                    ),
                ),
              ],
            ),
            const SizedBox(height: cardItemSeparation),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultButton(
                  buttonText: 'Add Picture', 
                  onPressed: () => {},
                  width: 150,
                ),
                DefaultButton(
                  buttonText: 'Confirm', 
                  onPressed: () => _viewModel.createPatient(context),
                  width: 150,
                ),
              ],
            )
             
          ],
        ),
      ),
    );
  }
}