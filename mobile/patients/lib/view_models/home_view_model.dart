import 'package:flutter/material.dart';
import 'package:patients/constants/home_page_numbers.dart';
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

  Widget buildFab(BuildContext context, int currentPage) {

    String label = '';
    String route = '';
    late Icon icon; 

    switch (currentPage) {
      case patientsPage:
        label = 'Create patient';
        icon = const Icon(Icons.person);
        route = '/createPatient';
      case appointmentsPage:
        label = 'Create appointment';
        icon = const Icon(Icons.event);
        route = '/home';
    }

    return FloatingActionButton.extended(
      onPressed: () => Navigator.of(context).pushNamed(route), 
      label: Text(label),
      icon: icon,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    ); 

  }
}