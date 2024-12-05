import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patients/constants/home_page_numbers.dart';
import 'package:patients/constants/shared_preferences_keys.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/user_model.dart';
import 'package:patients/repositories/api_user_repository.dart';
import 'package:patients/repositories/user_repository_interface.dart';
import 'package:patients/view_models/show_error_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ShowErrorViewModel with ChangeNotifier {
  final UserRepositoryInterface userRepository = ApiUserRepository();
  UserModel? user;
  bool isLoading = true;
  final MethodChannel _channel = const MethodChannel('com.example.patients/channel');

  Future<void> getUserInfo(BuildContext context) async {
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

  void logout(BuildContext context) async {
    user = null;
    isLoading = false;
    AuthController.instance.email.text = '';
    AuthController.instance.password.text = '';
    AuthController.instance.loginModel?.accessToken = '';
    AuthController.instance.loginModel?.refreshToken = '';
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(refreshTokenKey);
    Navigator.of(context).pushReplacementNamed('/');

  }

  Widget? buildFab(BuildContext context, int currentPage) {
    if (currentPage == appointmentsPage) {
      return null;
    }
 
    const label = 'Create patient';
    const icon = Icon(Icons.person);
    const route = '/createPatient';

    return FloatingActionButton.extended(
      onPressed: () => Navigator.of(context).pushNamed(route), 
      label: const Text(label),
      icon: icon,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    ); 


  }
  void getBattery(BuildContext context) async {
    try {
      final String result = await _channel.invokeMethod('getBattery');
      showError(context, 'Battery level $result');
    } on PlatformException catch (error) {
      showError(context, error.toString());
    }
  }
}