import 'package:flutter/material.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/logger.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthController _authController = AuthController.instance;

  TextEditingController get emailController => _authController.email;
  TextEditingController get passwordController => _authController.password;

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
      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      _showAuthenticationError(context, error.toString());
    }
  }

  void navigateToSignUp(BuildContext context) {
    logger.d('Clicou');
    Navigator.pushNamed(context, '/signUp');
  }

  void _showAuthenticationError(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(content: Text(errorMessage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}