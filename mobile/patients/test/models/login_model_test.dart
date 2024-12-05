import 'package:flutter_test/flutter_test.dart';
import 'package:patients/models/login_model.dart';

void main() {
  group('LoginModel Tests', () {
    test('fromJson should correctly parse JSON into LoginModel', () {
      final json = {
        'accessToken': 'sampleAccessToken',
        'refreshToken': 'sampleRefreshToken',
      };

      final loginModel = LoginModel.fromJson(json);

      expect(loginModel.accessToken, 'sampleAccessToken');
      expect(loginModel.refreshToken, 'sampleRefreshToken');
    });

    test('toJson should correctly convert LoginModel to JSON', () {
      final loginModel = LoginModel(
        accessToken: 'sampleAccessToken',
        refreshToken: 'sampleRefreshToken',
      );

      final json = loginModel.toJson();

      expect(json['accessToken'], 'sampleAccessToken');
      expect(json['refreshToken'], 'sampleRefreshToken');
    });

    test('fromJson should handle missing fields gracefully', () {
      final json = {
        'accessToken': 'sampleAccessToken',
      };

      final loginModel = LoginModel.fromJson(json);

      expect(loginModel.accessToken, 'sampleAccessToken');
      expect(loginModel.refreshToken, isNull);
    });

    test('toJson should handle null fields gracefully', () {
      final loginModel = LoginModel();

      final json = loginModel.toJson();

      expect(json['accessToken'], isNull);
      expect(json['refreshToken'], isNull);
    });
  });
}
