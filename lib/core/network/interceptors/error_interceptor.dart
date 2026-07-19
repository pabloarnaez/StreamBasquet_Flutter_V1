import 'package:dio/dio.dart';

import '../../errors/app_exception.dart';

/// Interceptor que convierte errores de red en excepciones de la app.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final message = err.response?.data != null ? err.response?.data.toString() : err.message;

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: AppException(
          message ?? err.message ?? 'Request failed',
          statusCode: status,
          code: 'dio_error',
          exception: err,
        ),
      ),
    );
  }
}
