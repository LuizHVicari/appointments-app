import 'dart:io';

import 'package:patients/dio.dart';
import 'package:patients/logger.dart';
import 'package:patients/models/user_model.dart';
import 'package:patients/repositories/user_repository_interface.dart';

class ApiUserRepository implements UserRepositoryInterface{
  @override
  Future<UserModel?> createUser(String email, String password, String name) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserInfo() async {
    final response = await dio.get('users');
    logger.d(response.data);

    if (response.statusCode == HttpStatus.ok) {
      final userModel = UserModel.fromJson(response.data);
      return userModel;
    }

    logger.w(response.data, time: DateTime.now());
    throw response.data['message'] ?? 'Unknown error';

  }


}