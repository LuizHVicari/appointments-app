import 'package:flutter/material.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/login_model.dart';
import 'package:patients/repositories/api_auth_repository.dart';
import 'package:patients/repositories/auth_repository_interface.dart';

class AuthController {
  static AuthController instance = AuthController();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginModel? loginModel;
  bool isLoggedIn = false;

  final AuthRepositoryInterface _authRepository = ApiAuthRepository();

  Future<String> refresh() async {
    final refreshModel = await _authRepository.refresh(loginModel!.refreshToken!);
    loginModel = LoginModel(refreshToken: loginModel!.refreshToken!, accessToken: refreshModel.accessToken);
    return refreshModel.accessToken!;
  }

  Future<void> login() async {
    loginModel = await _authRepository.login(email.text, password.text);
    logger.i('User logged in, accessToken: ${loginModel?.accessToken}');
    logger.i(loginModel?.accessToken);
  }

}