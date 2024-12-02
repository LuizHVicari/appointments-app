import 'package:flutter/material.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/repositories/api_user_repository.dart';
import 'package:patients/repositories/user_repository_interface.dart';
import 'package:patients/view_models/show_error_view_model.dart';

class SignUpViewModel extends ShowErrorViewModel with ChangeNotifier {
  final AuthController _authController = AuthController.instance;
  final UserRepositoryInterface userRepository = ApiUserRepository(); 

  TextEditingController get emailController => AuthController.instance.email; 
  TextEditingController nameController = TextEditingController(); 
  TextEditingController get passwordController => AuthController.instance.password;
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (emailController.text == '') {
      showError(context, 'Please enter your e-mail');
      return;
    }
    if (nameController.text == '') {
      showError(context, 'Please enter your name');
      return;
    }
    if (passwordController.text == '') {
      showError(context, 'Please enter your password');
      return;
    }
    if (confirmPasswordController.text == '') {
      showError(context, 'Please confirm your password');
      return;
    }
    if (confirmPasswordController.text != passwordController.text) {
      showError(context, 'Passwords are not equal');
    }
    
    try {
      await userRepository.createUser(
        emailController.text,
        passwordController.text, 
        nameController.text
      );
      await _authController.login();
      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      showError(context, error.toString());
    }
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/signUp');
  }

}