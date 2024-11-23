import 'package:patients/models/user_model.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> getUserInfo();

  Future<UserModel?> createUser(String email, String password, String name);
}