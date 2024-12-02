import 'package:flutter/material.dart';
import 'package:patients/constants/shared_preferences_keys.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthController _authController = AuthController.instance;

  TextEditingController get emailController => _authController.email;
  TextEditingController get passwordController => _authController.password;

  Future<void> verifyUserLogin(context) async {
    final preferences = await SharedPreferences.getInstance();
    final refreshToken = preferences.getString(refreshTokenKey);

    if (refreshToken != null) {
      AuthController.instance.loginModel = LoginModel(refreshToken: refreshToken);
      await AuthController.instance.refresh();
      Navigator.of(context).pushReplacementNamed('/home');
    }

  }

  Future<void> login(BuildContext context) async {
    if (emailController.text == '') {
      _showAuthenticationError(context, 'Please enter your e-mail');
      return;
    }
    if (passwordController.text == '') {
      _showAuthenticationError(context, 'Please enter your password');
      return;
    }
    try {
      await _authController.login();
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(
        refreshTokenKey,
         _authController.loginModel!.refreshToken!
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      _showAuthenticationError(context, error.toString());
    }
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/signUp');
  }

  void _showAuthenticationError(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(content: Text(errorMessage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}