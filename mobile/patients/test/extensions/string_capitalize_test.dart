import 'package:flutter_test/flutter_test.dart';
import 'package:patients/common/extensions.dart';

void main() {
  group('String Extension Tests', () {
    test('should capitalize the first letter and make the rest lowercase', () {
      expect('hello'.capitalize(), 'Hello');
      expect('HELLO'.capitalize(), 'Hello');
      expect('hElLo'.capitalize(), 'Hello');
      expect('h'.capitalize(), 'H');
      expect(''.capitalize(), ''); 
    });
  });
}
