import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// LoggerInterceptor registra requests y responses.
class LoggerInterceptor extends Interceptor {
  LoggerInterceptor({Logger? logger}) : _logger = logger ?? Logger();

  final Logger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('→ ${options.method} ${options.uri}');
    if (options.data != null) {
      _logger.d('Request data: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('← ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');
    _logger.d('Response data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.w('⚠ ${err.response?.statusCode} ${err.requestOptions.method} ${err.requestOptions.uri}');
    _logger.w(err.message ?? 'Unexpected error');
    super.onError(err, handler);
  }
}
