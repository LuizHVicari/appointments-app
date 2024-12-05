import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/patient_card.dart';
import 'package:patients/models/patient_model.dart';

void main() {
  testWidgets('PatientCard displays patient details correctly', (WidgetTester tester) async {
    final patient = PatientModel(
      name: 'John Doe',
      phone: '123-456-7890',
      age: 30,
      gender: 'Male',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PatientCard(patient: patient),
        ),
      ),
    );

    expect(find.text('John doe'), findsOneWidget);
    expect(find.text('123-456-7890'), findsOneWidget);

    expect(find.byIcon(Icons.male), findsOneWidget);
  });

  testWidgets('PatientCard displays the correct age', (WidgetTester tester) async {
    final patient = PatientModel(
      name: 'Jane Doe',
      phone: '987-654-3210',
      age: 25,
      gender: 'Female',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PatientCard(patient: patient),
        ),
      ),
    );

    expect(find.text('25'), findsOneWidget);
  });

  testWidgets('PatientCard displays the default icon for unknown gender', (WidgetTester tester) async {
    final patient = PatientModel(
      name: 'Alex Doe',
      phone: '555-555-5555',
      age: 40,
      gender: 'Unknown',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PatientCard(patient: patient),
        ),
      ),
    );

    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('PatientCard navigates to patient details when icon is tapped', (WidgetTester tester) async {
    final patient = PatientModel(
      name: 'John Doe',
      phone: '123-456-7890',
      age: 30,
      gender: 'Male',
    );

    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/patientDetails': (context) => const Scaffold(body: Text('Patient Details Page')),
        },
        home: Scaffold(
          body: PatientCard(patient: patient),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pumpAndSettle();

    expect(find.text('Patient Details Page'), findsOneWidget);
  });
}
