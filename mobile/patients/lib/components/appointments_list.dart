import 'package:flutter/material.dart';
import 'package:patients/components/appointment_card.dart';
import 'package:patients/view_models/appointment_list_view_model.dart';
import 'package:provider/provider.dart';

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({super.key});

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchAppointments();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _fetchAppointments();
    }
  }

  void _fetchAppointments() {
    Provider.of<AppointmentListViewModel>(context, listen: false)
      .listAppointments(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentListViewModel>(
        builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
         return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (viewModel.appointments.isEmpty) {
        return const Text('No appointments to display');
      }
     
      return RefreshIndicator(
        onRefresh: () async => await viewModel.listAppointments(context),
        child: ListView.builder(
          itemCount: viewModel.appointments.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            final appointment = viewModel.appointments[index];
            if (appointment != null) {
              return AppointmentCard(appointmentModel: appointment);
            } 
            return const SizedBox.shrink(); 

          }
        ),
      );
    });
  }
}
