import 'package:flutter_test/flutter_test.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/models/user_model.dart';

void main() {
  group('PatientModel Tests', () {
    test('fromJson should correctly parse JSON into PatientModel', () {
      final json = {
        'id': '123',
        'name': 'John Doe',
        'phone': '123456789',
        'age': 30,
        'gender': 'Male',
        'user': {
          'id': '456',
          'name': 'Admin',
          'email': 'admin@example.com',
        },
      };

      final patient = PatientModel.fromJson(json);

      expect(patient.id, '123');
      expect(patient.name, 'John Doe');
      expect(patient.phone, '123456789');
      expect(patient.age, 30);
      expect(patient.gender, 'Male');
      expect(patient.user?.id, '456');
      expect(patient.user?.name, 'Admin');
      expect(patient.user?.email, 'admin@example.com');
    });

    test('toJson should correctly convert PatientModel to JSON', () {
      final user = UserModel(id: '456', name: 'Admin', email: 'admin@example.com');
      final patient = PatientModel(
        id: '123',
        name: 'John Doe',
        phone: '123456789',
        age: 30,
        gender: 'Male',
        user: user,
      );

      final json = patient.toJson();

      expect(json['id'], '123');
      expect(json['name'], 'John Doe');
      expect(json['phone'], '123456789');
      expect(json['age'], 30);
      expect(json['gender'], 'Male');
      expect(json['user'], isNotNull);
      expect(json['user']['id'], '456');
      expect(json['user']['name'], 'Admin');
      expect(json['user']['email'], 'admin@example.com');
    });

    test('fromJson should handle missing optional fields', () {
      final json = {
        'id': '123',
        'name': 'Jane Doe',
        'phone': '987654321',
      };

      final patient = PatientModel.fromJson(json);

      expect(patient.id, '123');
      expect(patient.name, 'Jane Doe');
      expect(patient.phone, '987654321');
      expect(patient.age, isNull);
      expect(patient.gender, isNull);
      expect(patient.user, isNull);
    });

    test('toJson should handle null fields gracefully', () {
      final patient = PatientModel(
        id: '123',
        name: 'Jane Doe',
        phone: '987654321',
      );

      final json = patient.toJson();

      expect(json['id'], '123');
      expect(json['name'], 'Jane Doe');
      expect(json['phone'], '987654321');
      expect(json['age'], isNull);
      expect(json['gender'], isNull);
      expect(json['user'], isNull);
    });
  });
}
