import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointmentModel;
  const AppointmentCard({super.key, required this.appointmentModel});

  String getTime(BuildContext context) {
    var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    var format = DateFormat.Hm(tag);
    return format.format(appointmentModel.date!);
  }

  String getDate(BuildContext context) {
    var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    var format = DateFormat.yMd(tag);
    return format.format(appointmentModel.date!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text (getDate(context), style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                      Text (getTime(context), style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                    ],
                  ),
                ),
                const SizedBox(width: cardItemSeparation),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3  ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text (appointmentModel.patient?.name ?? 'No name for this patient', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                      Text (appointmentModel.place ?? '', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                    ],
                  ),
                ),  
              ]
            ),
            IconButton(
              onPressed: () => {Navigator.of(context)
                .pushNamed('/appointmentDetails', arguments: appointmentModel)}, 
              icon: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onPrimaryContainer,)
            )
          ],
        ),
      ),
    );
  }
}


