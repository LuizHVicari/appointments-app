
import 'package:flutter/material.dart';
import 'package:patients/components/appointment_card.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/models/patient_model.dart';

class AppointmentsList extends StatelessWidget {
  final demoAppointment = AppointmentModel(
    appointmentId: 'a',
    patient: PatientModel(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget accumsan urna, ac varius velit. Nunc ac nisl non augue condimentum rutrum. Sed viverra ornare orci, sed pulvinar elit hendrerit egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse viverra varius arcu, at faucibus arcu consequat ac. Integer convallis in odio quis dictum. Sed sollicitudin velit et nisi eleifend pharetra. Morbi ut feugiat ipsum, in vulputate purus. Mauris congue eros sit amet massa venenatis vulputate.', 
      patientId: 'a', 
      name: 'Luiz', 
      gender: 'Male', 
      phoneNumber: '(46) 99971-9906', 
      age: 23,
    ), 
    schedule: DateTime.now(), 
    place: 'Pato Branco', 
    attended: false, 
    confirmed: false,
    details: 'Curabitur vel ultricies tellus. Proin vitae enim et augue placerat convallis eget sit amet ipsum. In elementum scelerisque erat, sed auctor ante ullamcorper in. Nam vel luctus dui. Pellentesque lorem nisl, viverra sit amet aliquam sed, placerat eget metus. Cras nisi augue, tincidunt vel mi vel, euismod ullamcorper orci. Cras malesuada finibus purus, non pellentesque ipsum porttitor ut. Aliquam quis orci eget odio porttitor eleifend at a neque. Praesent porttitor neque non purus imperdiet, ut finibus nibh pellentesque. Duis hendrerit suscipit urna, ac viverra dolor lobortis in.'
  );

  AppointmentsList({super.key});

  Future<void> refreshPage() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refreshPage(),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          AppointmentCard(appointmentModel: demoAppointment),
          AppointmentCard(appointmentModel: demoAppointment),
          AppointmentCard(appointmentModel: demoAppointment),
          AppointmentCard(appointmentModel: demoAppointment),
          AppointmentCard(appointmentModel: demoAppointment),
        ],
      ),
    );
  }
}