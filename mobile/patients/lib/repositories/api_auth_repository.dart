import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:patients/dio.dart';
import 'package:patients/models/login_model.dart';
import 'package:patients/models/refresh_model.dart';
import 'package:patients/repositories/auth_repository_interface.dart';

class ApiAuthRepository implements AuthRepositoryInterface{
  @override
  Future<LoginModel?> login(String email, String password) async {
    try {
      Response response = await dio.post(
        'auth/login',
        data: {
          'username': email,
          'password': password
        }
      );

      if (response.statusCode == 201) {
        return LoginModel.fromJson(response.data);
      }
      throw 'Could not authenticate';
    } catch (e) {
      log(e.toString(), time: DateTime.now(), level: Level.WARNING.value);
    } 
    return null;
  }

  @override
  RefreshModel refresh(String refreshToken) {
    // TODO: implement refresh
    throw UnimplementedError();
  }
}