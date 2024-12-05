import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/default_input_text.dart';

void main() {
  testWidgets('Test DefaultInputText widget input and visibility toggle', (WidgetTester tester) async {
    final textController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            surface: Colors.white,
          ),
        ),
        home: Scaffold(
          body: DefaultInputText(
            label: 'Password',
            textController: textController,
            canToggleVisibility: true,
          ),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Password'), findsNWidgets(2));

    expect(textController.text, '');

    await tester.enterText(find.byType(TextField), 'TestPassword123');
    await tester.pump();

    expect(textController.text, 'TestPassword123');

    expect(find.byIcon(Icons.visibility), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    expect(find.byIcon(Icons.visibility), findsOneWidget);

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });

  testWidgets('Test DefaultInputText without visibility toggle', (WidgetTester tester) async {
    final textController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            surface: Colors.white,
          ),
        ),
        home: Scaffold(
          body: DefaultInputText(
            label: 'Email',
            textController: textController,
            canToggleVisibility: false,
          ),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Email'), findsNWidgets(2));

    expect(find.byIcon(Icons.visibility), findsNothing);
    expect(find.byIcon(Icons.visibility_off), findsNothing);
  });
}
