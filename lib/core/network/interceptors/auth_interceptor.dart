import 'package:dio/dio.dart';

/// Authorization interceptor that injects the bearer token when available.
class AuthInterceptor extends Interceptor {
  /// A synchronous callback that should return the current token or null.
  final String? Function()? tokenGetter;

  AuthInterceptor({required this.tokenGetter});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = tokenGetter?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
