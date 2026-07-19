import 'package:dio/dio.dart';

import 'api_exception.dart';

/// Representa un error de aplicación con contexto de red o negocio.
class AppException extends ApiException {
  /// Crea una excepción de aplicación tipada.
  AppException(
    super.message, {
    super.statusCode,
    this.code,
    this.exception,
    this.stackTrace,
  });

  /// Código semántico del error.
  final String? code;

  /// Excepción original que originó el problema.
  final Object? exception;

  /// Traza de la excepción original.
  final StackTrace? stackTrace;
}

/// Representa una falla de dominio o de infraestructura para el UI.
class Failure implements Exception {
  /// Crea una falla con mensaje y contexto opcional.
  const Failure(
    this.message, {
    this.code,
    this.exception,
    this.stackTrace,
  });

  /// Mensaje legible para la capa de presentación.
  final String message;

  /// Código de error estable.
  final String? code;

  /// Excepción original.
  final Object? exception;

  /// Traza asociada.
  final StackTrace? stackTrace;

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}

/// Convierte errores de infraestructura en fallas manejables.
class ErrorHandler {
  /// Crea un manejador de errores global.
  const ErrorHandler();

  /// Convierte un error en una instancia de [Failure].
  Failure handle(Object error, {StackTrace? stackTrace}) {
    if (error is Failure) {
      return error;
    }

    if (error is AppException) {
      return Failure(
        error.message,
        code: error.code ?? 'app_exception',
        exception: error,
        stackTrace: error.stackTrace ?? stackTrace,
      );
    }

    if (error is ApiException) {
      return Failure(
        error.message,
        code: 'api_exception',
        exception: error,
        stackTrace: stackTrace,
      );
    }

    if (error is DioException) {
      return handle(error.toApiException(), stackTrace: stackTrace);
    }

    return Failure(
      error.toString(),
      code: 'unknown_error',
      exception: error,
      stackTrace: stackTrace,
    );
  }
}

/// Excepciones de red específicas para el cliente HTTP.
class NetworkException extends AppException {
  /// Crea una excepción de red.
  NetworkException(String message, {super.statusCode, super.code}) : super(message, statusCode: statusCode);
}

/// Excepción cuando la solicitud no está autorizada.
class UnauthorizedException extends AppException {
  /// Crea una excepción de autorización.
  UnauthorizedException([String message = 'Unauthorized']) : super(message, statusCode: 401, code: 'unauthorized');
}

/// Excepción cuando la solicitud supera el tiempo de espera.
class TimeoutException extends AppException {
  /// Crea una excepción de timeout.
  TimeoutException([String message = 'Request timeout']) : super(message, statusCode: 408, code: 'timeout');
}

/// Excepción cuando el servidor responde con error.
class ServerException extends AppException {
  /// Crea una excepción de servidor.
  ServerException(String message, {super.statusCode}) : super(message, statusCode: statusCode, code: 'server_error');
}

/// Extensión para convertir errores de Dio a excepciones de la app.
extension DioExceptionX on DioException {
  /// Convierte un [DioException] a una excepción de app.
  ApiException toApiException() {
    if (error is AppException) {
      return error as AppException;
    }

    if (error is ApiException) {
      return error as ApiException;
    }

    final statusCode = response?.statusCode;
    final data = response?.data;

    final message = switch (type) {
      DioExceptionType.connectionTimeout || DioExceptionType.sendTimeout || DioExceptionType.receiveTimeout => 'Request timeout',
      DioExceptionType.badResponse => data is Map<String, dynamic>
          ? data['message']?.toString() ?? 'Request failed'
          : data?.toString() ?? 'Request failed',
      DioExceptionType.cancel => 'Request cancelled',
      DioExceptionType.connectionError => 'No internet connection',
      DioExceptionType.badCertificate => 'Certificate validation failed',
      _ => 'Unexpected network error',
    };

    if (statusCode == 401) {
      return UnauthorizedException(message);
    }

    if (statusCode != null && statusCode >= 500) {
      return ServerException(message, statusCode: statusCode);
    }

    if (type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return TimeoutException(message);
    }

    return NetworkException(message, statusCode: statusCode);
  }
}
