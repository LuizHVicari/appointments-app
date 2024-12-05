import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/default_button.dart';

void main() {
  testWidgets('Test DefaultButton displays correct text and triggers onPressed', (WidgetTester tester) async {
    bool isPressed = false;
    void onPressed() {
      isPressed = true;
    }

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            tertiaryContainer: Colors.purple,
            onTertiaryContainer: Colors.white,
          ),
        ),
        home: Scaffold(
          body: DefaultButton(
            buttonText: 'Click Me',
            onPressed: onPressed,
          ),
        ),
      ),
    );

    expect(find.text('Click Me'), findsOneWidget);

    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    final ButtonStyle style = button.style!;
    final backgroundColor = style.backgroundColor!.resolve({});
    final foregroundColor = style.foregroundColor!.resolve({});

    expect(backgroundColor, Colors.purple);
    expect(foregroundColor, Colors.white);

    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    expect(isPressed, true);
  });
}
