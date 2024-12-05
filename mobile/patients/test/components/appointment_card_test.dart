import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/appointment_card.dart';
import 'package:patients/models/appointment_model.dart';
import 'package:patients/models/patient_model.dart';

void main() {
  testWidgets('Test AppointmentCard displays appointment details correctly', (WidgetTester tester) async {
    final appointmentModel = AppointmentModel(
      date: DateTime(2024, 12, 5, 14, 30),
      place: "Hospital ABC",
      patient: PatientModel(name: "John Doe"), confirmed: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppointmentCard(appointmentModel: appointmentModel),
        ),
      ),
    );

    expect(find.text('12/5/2024'), findsOneWidget);
    expect(find.text('14:30'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Hospital ABC'), findsOneWidget);
  });
}
