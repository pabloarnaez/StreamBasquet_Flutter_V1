import 'package:dio/dio.dart';

/// Interceptor que reintenta peticiones temporales cuando el servidor falla.
class RetryInterceptor extends Interceptor {
  /// Crea un interceptor de reintento.
  RetryInterceptor({required this.dio, this.maxRetries = 2, this.delay = const Duration(milliseconds: 500)});

  /// Cliente Dio al que se adjunta el interceptor.
  final Dio dio;

  /// Cantidad máxima de reintentos.
  final int maxRetries;

  /// Retraso entre intentos.
  final Duration delay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      for (var attempt = 1; attempt <= maxRetries; attempt++) {
        await Future<void>.delayed(delay);
        try {
          final response = await dio.fetch(err.requestOptions);
          handler.resolve(response);
          return;
        } on DioException catch (retryError) {
          if (attempt == maxRetries || !_shouldRetry(retryError)) {
            handler.next(retryError);
            return;
          }
        }
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException error) {
    final statusCode = error.response?.statusCode;
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        (statusCode != null && statusCode >= 500);
  }
}
