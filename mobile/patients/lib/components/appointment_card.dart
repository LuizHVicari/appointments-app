import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patients/components/draggable_card.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/models/appointment_model.dart';

class AppointmentCard extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const AppointmentCard({super.key, required this.appointmentModel});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String getTime(BuildContext context) {
    var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    var format = DateFormat.Hm(tag);
    return format.format(widget.appointmentModel.schedule);
  }

  String getDate(BuildContext context) {
    var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    var format = DateFormat.yMd(tag);
    return format.format(widget.appointmentModel.schedule);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableCard(
      onSwipe: () => {
        setState(() {
          widget.appointmentModel.confirmed = !widget.appointmentModel.confirmed;
        }),
        log(widget.appointmentModel.confirmed.toString())
      },
      background: cardBackground(context),
      child: cardForeground(context),
    );
  }

  Widget cardForeground(BuildContext context) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (getDate(context)),
                    Text (getTime(context)),
                  ],
                ),
                const SizedBox(width: cardItemSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (widget.appointmentModel.patient.name?? 'No name for this patient'),
                    Text (widget.appointmentModel.place),
                  ],
                ),  
                const SizedBox(width: cardItemSeparation), 
                SizedBox(
                  width: 150,
                  height: 50,
                  child: Text(
                    widget.appointmentModel.details != null 
                    ?'${widget.appointmentModel.details!}...' 
                    : 'No details available',
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  )
                )             
              ],
            ),
            IconButton(
              onPressed: () => {}, 
              icon: const Icon(Icons.chevron_right)
            )
          ],
        ),
      ),
    );
  }

  Widget cardBackground(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Container(
        padding: const EdgeInsets.all(pagePadding),
        width: MediaQuery.sizeOf(context).width,
        height: 62,
        decoration: BoxDecoration(
          color: widget.appointmentModel.confirmed
            ? Theme.of(context).colorScheme.errorContainer
            : Theme.of(context).colorScheme.primaryContainer ,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: const Row(
          children: [
            Icon(Icons.check),
            Text('Confirm')
          ],
        ),
      )
    );
  }
}


