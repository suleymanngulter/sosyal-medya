enum Environment { development, staging, production }

class ApiConfig {
  // Environment-based base URL
  static String get baseUrl {
    // Önce environment variable'dan kontrol et
    const envUrl = String.fromEnvironment('API_BASE_URL', defaultValue: '');
    if (envUrl.isNotEmpty) {
      return envUrl;
    }

    // Environment'a göre URL döndür
    switch (currentEnvironment) {
      case Environment.production:
        return 'https://api.sosyalmedya.com/v1';
      case Environment.staging:
        return 'https://staging-api.sosyalmedya.com/v1';
      case Environment.development:
      default:
        // Development için mock API veya gerçek API URL'i
        // Gerçek API kullanmak için buraya URL'inizi yazın
        // Örnek: 'https://jsonplaceholder.typicode.com' (test için)
        return 'https://dev-api.sosyalmedya.com/v1';
    }
  }

  // Mevcut environment
  static Environment get currentEnvironment {
    const env = String.fromEnvironment('ENV', defaultValue: 'development');
    switch (env.toLowerCase()) {
      case 'production':
      case 'prod':
        return Environment.production;
      case 'staging':
      case 'stage':
        return Environment.staging;
      case 'development':
      case 'dev':
      default:
        return Environment.development;
    }
  }

  static String get apiKey => const String.fromEnvironment(
        'API_KEY',
        defaultValue: '',
      );

  static bool get isProduction =>
      const bool.fromEnvironment('dart.vm.product') ||
      currentEnvironment == Environment.production;

  // Timeout ayarları
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
}
