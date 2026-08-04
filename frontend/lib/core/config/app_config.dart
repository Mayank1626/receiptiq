enum Environment {
  dev,
  prod,
}

class AppConfig {
  final Environment environment;
  final String apiBaseUrl;

  AppConfig({
    required this.environment,
    required this.apiBaseUrl,
  });

  static AppConfig dev() {
    return AppConfig(
      environment: Environment.dev,
      apiBaseUrl: 'http://10.0.2.2:8000/api/v1',
    );
  }

  static AppConfig prod() {
    return AppConfig(
      environment: Environment.prod,
      apiBaseUrl: 'https://api.receiptiq.com/api/v1',
    );
  }

  // Singleton instance
  static late AppConfig _instance;
  static AppConfig get instance => _instance;

  static void initialize(Environment env) {
    switch (env) {
      case Environment.dev:
        _instance = AppConfig.dev();
        break;
      case Environment.prod:
        _instance = AppConfig.prod();
        break;
    }
  }
}
