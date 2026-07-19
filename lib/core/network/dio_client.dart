import 'package:dio/dio.dart';

import '../errors/app_exception.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logger_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

/// Crea un cliente HTTP configurado con interceptores reutilizables.
Dio createDio({required String baseUrl, String? Function()? tokenGetter, bool enableLogging = true}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(tokenGetter: tokenGetter ?? () => null),
    if (enableLogging) LoggerInterceptor(),
    RetryInterceptor(dio: dio),
    ErrorInterceptor(),
  ]);

  return dio;
}

/// Ejecuta una petición HTTP y convierte los errores a [Failure].
Future<T> executeRequest<T>({
  required Dio dio,
  required Future<T> Function() request,
}) async {
  final errorHandler = ErrorHandler();

  try {
    return await request();
  } on DioException catch (error) {
    throw errorHandler.handle(error);
  } on AppException catch (error) {
    throw errorHandler.handle(error);
  } on Failure {
    rethrow;
  }
}
