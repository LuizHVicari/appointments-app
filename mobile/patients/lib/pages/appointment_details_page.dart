import 'package:flutter/material.dart';
import 'package:patients/common/extensions.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/view_models/appointment_details_view_model.dart';
import 'package:provider/provider.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final AppointmentModel appointmentModel;

  const AppointmentDetailsPage({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment details'),
        actions: [
          IconButton(
            onPressed: () async => await Provider.of<AppointmentDetailsViewModel>(context, listen: false)
              .changeAppointmentStatus(context, appointmentModel), 
            icon: appointmentModel.confirmed == false ? const Icon(Icons.check) : const Icon(Icons.close)
          ),
          IconButton(
            onPressed: () async => await Provider.of<AppointmentDetailsViewModel>(context, listen: false)
              .deleteAppointment(context, appointmentModel.id ?? ''), 
            icon: const Icon(Icons.delete)
          ),
          // IconButton(
          //   onPressed: () => {}, 
          //   icon: const Icon(Icons.edit)
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appointmentModel.patient?.name ?? '', style: const TextStyle(fontSize: fontBig),),
            Text('Date: ${appointmentModel.date?.localeFormat(context)}', style: const TextStyle(fontSize: fontMedium),),
            Text('Place: ${appointmentModel.place}', style: const TextStyle(fontSize: fontMedium),),
            const Divider(),
            Text(appointmentModel.details ?? '', style: const TextStyle(fontSize: fontMedium,), textAlign: TextAlign.justify,),


          ],
        ),
      ),
    );
  }
}