import 'dart:io';

import 'package:dio/dio.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/dio.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/login_model.dart';
import 'package:patients/models/refresh_model.dart';
import 'package:patients/repositories/auth_repository_interface.dart';

class ApiAuthRepository implements AuthRepositoryInterface{
  @override
  Future<LoginModel> login(String email, String password) async {
      Response response = await dio.post(
        'auth/login',
        data: {
          'email': email,
          'password': password
        }
      );

      if (response.statusCode == HttpStatus.created) {
        return LoginModel.fromJson(response.data);
      }
      logger.d(response.data);
      throw response.data['message'] ?? 'Unknown Error';
  }

  @override
  Future<RefreshModel> refresh(String refreshToken) async {
    final response = await dio.post('auth/refresh', data: {
      'refreshToken': AuthController.instance.loginModel?.refreshToken
    });
    return RefreshModel.fromJson(response.data);
  }
}