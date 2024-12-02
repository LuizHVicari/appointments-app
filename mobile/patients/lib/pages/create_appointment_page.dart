import 'package:flutter/material.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/view_models/create_appointment_view_model.dart';
import 'package:provider/provider.dart';

class CreateAppointmentPage extends StatelessWidget {
  final PatientModel patientModel;
  const CreateAppointmentPage({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAppointmentViewModel>(
            builder: (context, viewModel, child){
      return Scaffold(
        appBar: AppBar(
          title: Text('New appointment for ${patientModel.name}'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => viewModel.createAppointment(context, patientModel), 
          label: const Text('Create')
        ),
        body: Padding(
          padding: const EdgeInsets.all(pagePadding), 
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultInputText(label: 'Place', textController: viewModel.placeController),
                const SizedBox(height: cardItemSeparation,),
                DefaultInputText(label: 'Details', textController: viewModel.detailsController),
                const SizedBox(height: cardItemSeparation,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(buttonText: 'Select Date', onPressed: () async => viewModel.selectDate(context)),
                    const SizedBox(width: cardItemSeparation,),
                    DefaultButton(buttonText: 'Select Time', onPressed: () async => viewModel.selectTime(context))
                  ],
                ),
                viewModel.completeDateTime != null
                ? Text('Appointment will be schedule to ${viewModel.completeDateTime}')
                : const SizedBox.shrink()
              ],
            )
          ),
        );
      }
    );
  }
}