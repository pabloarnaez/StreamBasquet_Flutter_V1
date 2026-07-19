
/// Entornos soportados por la aplicación.
enum Environment { development, staging, production }

class AppConfig {
  AppConfig._(this.environment, this.baseUrl, {this.enableLogging = true});

  final Environment environment;
  final String baseUrl;
  final bool enableLogging;

  static late final AppConfig current = _loadFromEnv();

  static AppConfig _loadFromEnv() {
    const envString = String.fromEnvironment('ENV', defaultValue: 'development');
    final env = _parseEnv(envString);

    switch (env) {
      case Environment.production:
        return AppConfig._(env, 'https://api.streambasquet.com', enableLogging: false);
      case Environment.staging:
        return AppConfig._(env, 'https://staging.api.streambasquet.com');
      case Environment.development:
      default:
        return AppConfig._(env, 'https://dev.api.streambasquet.com');
    }
  }

  static Environment _parseEnv(String value) {
    switch (value.toLowerCase()) {
      case 'production':
      case 'prod':
        return Environment.production;
      case 'staging':
      case 'stage':
        return Environment.staging;
      default:
        return Environment.development;
    }
  }
}
