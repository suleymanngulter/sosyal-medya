import 'package:flutter/foundation.dart';
import '../api/api_client.dart';
import '../config/api_config.dart';

/// API bağlantısını test etmek için yardımcı sınıf
class ApiTestHelper {
  static Future<void> testConnection() async {
    final apiClient = ApiClient();
    
    if (kDebugMode) {
      print('🔍 API Test Başlatılıyor...');
      print('📍 Base URL: ${ApiConfig.baseUrl}');
      print('🌍 Environment: ${ApiConfig.currentEnvironment}');
      print('🔐 Production: ${ApiConfig.isProduction}');
    }

    try {
      // Basit bir GET isteği ile bağlantıyı test et
      // Bu endpoint gerçek API'nizde olmayabilir, sadece bağlantı testi için
      final response = await apiClient.get('/health');
      
      if (kDebugMode) {
        print('✅ API Bağlantısı Başarılı!');
        print('📊 Status Code: ${response.statusCode}');
        print('📦 Response: ${response.data}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ API Bağlantı Hatası: $e');
        print('💡 İpucu: API base URL\'ini kontrol edin');
        print('💡 İpucu: İnternet bağlantınızı kontrol edin');
      }
    }
  }

  static void printConfig() {
    if (kDebugMode) {
      print('\n📋 API Konfigürasyonu:');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('Base URL: ${ApiConfig.baseUrl}');
      print('Environment: ${ApiConfig.currentEnvironment}');
      print('Is Production: ${ApiConfig.isProduction}');
      print('API Key: ${ApiConfig.apiKey.isEmpty ? "Yok" : "***"}');
      print('Connect Timeout: ${ApiConfig.connectTimeout.inSeconds}s');
      print('Receive Timeout: ${ApiConfig.receiveTimeout.inSeconds}s');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
    }
  }
}
