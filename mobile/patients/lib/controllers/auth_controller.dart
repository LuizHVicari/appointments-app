import 'package:patients/models/login_model.dart';
import 'package:patients/repositories/api_auth_repository.dart';
import 'package:patients/repositories/auth_repository_interface.dart';

class AuthController {
  static AuthController instance = AuthController();

  String email = '';
  String password = '';
  LoginModel? loginModel;
  bool isLoggedIn = false;

  final AuthRepositoryInterface _authRepository = ApiAuthRepository();

  Future<String> refresh() async {
    return '';
  }

  Future<bool> login() async {
    loginModel = await _authRepository.login(email, password);
    if (loginModel == null) {
      return false;
    }
    return true;
  }

}