import 'package:flutter/material.dart';
import 'package:patients/components/patient_card.dart';
import 'package:patients/view_models/patients_list_view_model.dart';
import 'package:provider/provider.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PatientsListViewModel>(context, listen: false).listPatients(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientsListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.patients.isEmpty) {
          viewModel.listPatients(context);
        }

        if (viewModel.patients.isEmpty && viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => await Provider
            .of<PatientsListViewModel>(context, listen: false)
            .listPatients(context),

          child: ListView.builder(
            itemCount: viewModel.patients.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final patient = viewModel.patients[index];
              if (patient != null) {
                return PatientCard(patient: patient);
              }
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
