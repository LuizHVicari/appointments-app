import 'package:flutter/material.dart';
import 'package:patients/components/patient_card.dart';
import 'package:patients/view_models/patients_list_view_model.dart';
import 'package:provider/provider.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchPatients();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _fetchPatients();
    }
  }

  void _fetchPatients() {
    Provider.of<PatientsListViewModel>(context, listen: false)
    .listPatients(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientsListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => await Provider
            .of<PatientsListViewModel>(context, listen: false)
            .listPatients(context),

          child: viewModel.patients.isEmpty 
          ?  SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Text('No patients to display')
            ),
          )
          : ListView.builder(
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
