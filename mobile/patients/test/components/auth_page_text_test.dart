import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/auth_page_text.dart';
import 'package:patients/constants/font_sizes.dart';

void main() {
  testWidgets('Test AuthPageText widget displays correct text and styles', (WidgetTester tester) async {
    const String line1 = 'Hello';
    const String line2 = 'Welcome Back!';

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            secondary: Colors.green,
          ),
        ),
        home: const Scaffold(
          body: AuthPageText(line1: line1, line2: line2),
        ),
      ),
    );

    expect(find.text(line1), findsOneWidget);
    expect(find.text(line2), findsOneWidget);

    final text1 = tester.widget<Text>(find.text(line1));
    final text2 = tester.widget<Text>(find.text(line2));

    expect(text1.style?.fontSize, fontExtraBig);
    expect(text1.style?.fontWeight, FontWeight.bold);
    expect(text1.style?.color, Colors.green);

    expect(text2.style?.fontSize, fontExtraBig);
    expect(text2.style?.fontWeight, FontWeight.bold);
    expect(text2.style?.color, Colors.blue);
  });
}
