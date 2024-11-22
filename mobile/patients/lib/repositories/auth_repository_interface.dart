import 'package:patients/models/login_model.dart';
import 'package:patients/models/refresh_model.dart';

abstract class AuthRepositoryInterface {

  Future<LoginModel?> login(String email,String password);

  RefreshModel refresh(String refreshToken);

}