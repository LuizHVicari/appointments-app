import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:patients/common/extensions.dart';

void main() {
  group('DateTime Extension Tests', () {
    testWidgets('localeFormat should format DateTime according to the locale', (WidgetTester tester) async {
      final dateTime = DateTime(2024, 12, 4, 15, 30);

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en', 'US'),
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final formattedDate = dateTime.localeFormat(context);
                expect(formattedDate, '12/4/2024, 3:30 PM');
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });

    testWidgets('localeFormat should format DateTime for different locale (e.g., pt_BR)', (WidgetTester tester) async {
      final dateTime = DateTime(2024, 12, 4, 15, 30);

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('pt', 'BR'),
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final formattedDate = dateTime.localeFormat(context);
                expect(formattedDate, '04/12/2024, 15:30'); 
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });
  });
}
