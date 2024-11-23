import 'package:flutter/material.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/user_model.dart';
import 'package:patients/repositories/api_user_repository.dart';
import 'package:patients/repositories/user_repository_interface.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepositoryInterface userRepository = ApiUserRepository();
  UserModel? user;
  bool isLoading = true;

  Future<void> getUserInfo(BuildContext context) async {
    logger.d('Fazendo requisição');
    logger.d(user?.name);
    if (user != null) {
      return;
    }
    isLoading = true;
    notifyListeners();
    try {
      user = await userRepository.getUserInfo();
      logger.d(user?.name);
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(content: Text(error.toString()))
      );
    }
  }

  void logout(BuildContext context) {
    user = null;
    isLoading = false;
    AuthController.instance.email.text = '';
    AuthController.instance.password.text = '';
    AuthController.instance.loginModel?.accessToken = '';
    AuthController.instance.loginModel?.refreshToken = '';
    notifyListeners();
    Navigator.of(context).pushReplacementNamed('/');

  }
}