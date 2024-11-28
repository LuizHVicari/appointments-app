import 'package:dio/dio.dart';
import 'package:patients/controllers/auth_controller.dart';
import 'package:patients/logger.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'http://172.27.176.1:3000/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10)
  )

);

addInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final accessToken = AuthController.instance.loginModel?.accessToken;
        if (accessToken != null && accessToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        logger.i(options.headers);
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        try {  
          logger.i('Authentication error, retrying');
          final refreshToken = AuthController.instance.loginModel?.refreshToken;
          if (e.response?.statusCode == 401 && refreshToken != null && refreshToken.isNotEmpty) {
            logger.i('Retrieving token from refresh', time: DateTime.now());

            String newAccessToken = await AuthController.instance.refresh();
            AuthController.instance.loginModel?.accessToken = newAccessToken;
            e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            
            final response = await dio.fetch(e.requestOptions);
            return handler.resolve(response);
          }
        } catch (refreshError) {
          logger.e('Token refresh failed, $refreshError');
        }
        return handler.next(e);
      }
    )
  );

  dio.options.validateStatus = (status) {
    return (status! >= 200 && status < 300) || status == 401;
  };
}