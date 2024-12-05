import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patients/components/information_row.dart'; // Adjust the import path
import 'package:patients/constants/font_sizes.dart'; // If necessary for font sizes

void main() {
  testWidgets('InformationRow displays label and info correctly', (WidgetTester tester) async {
    const label = 'Name';
    const info = 'John Doe';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InformationRow(label: label, info: info),
        ),
      ),
    );

    expect(find.text('$label: '), findsOneWidget);
    expect(find.text(info), findsOneWidget);
  });

  testWidgets('InformationRow uses default fontSize when not provided', (WidgetTester tester) async {
    const label = 'Age';
    const info = '30';

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InformationRow(label: label, info: info),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('$label: '));
    expect(textWidget.style?.fontSize, fontMedium);

    final infoTextWidget = tester.widget<Text>(find.text(info));
    expect(infoTextWidget.style?.fontSize, fontMedium);
  });

  testWidgets('InformationRow uses custom fontSize when provided', (WidgetTester tester) async {
    const label = 'Location';
    const info = 'New York';
    const customFontSize = 20.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InformationRow(label: label, info: info, fontSize: customFontSize),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('$label: '));
    expect(textWidget.style?.fontSize, customFontSize);

    final infoTextWidget = tester.widget<Text>(find.text(info));
    expect(infoTextWidget.style?.fontSize, customFontSize);
  });
}
