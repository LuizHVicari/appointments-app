import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:logging/logging.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'http://10.0.2.2:3000',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10)
  )

);

addInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${AuthController.instance.loginModel?.accessToken}';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          log('Token expired, refreshing...', time: DateTime.now(), level: Level.FINE.value);
          String newAccessToken = await AuthController.instance.refresh();
          e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          AuthController.instance.loginModel?.accessToken = newAccessToken;
          return handler.resolve(await dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      }
    )

  );
}