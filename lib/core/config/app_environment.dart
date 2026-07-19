import 'app_config.dart';

class AppEnvironment {
  const AppEnvironment._();

  static const AppEnvironment instance = AppEnvironment._();

  Environment get currentEnvironment => AppConfig.current.environment;

  bool get isDevelopment => currentEnvironment == Environment.development;
  bool get isStaging => currentEnvironment == Environment.staging;
  bool get isProduction => currentEnvironment == Environment.production;

  String get currentBaseUrl => AppConfig.current.baseUrl;
}
