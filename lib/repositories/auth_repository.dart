import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../models/user.dart';
import '../models/api_response.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final SharedPreferences _prefs;

  AuthRepository(this._apiClient, this._prefs);

  Future<User> login(String email, String password) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      User user;
      String? token;
      String? refreshToken;

      if (response.data is Map) {
        final apiResponse = ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => data,
        );

        if (apiResponse.data != null) {
          final data = apiResponse.data as Map<String, dynamic>;
          user = User.fromJson(data['user'] as Map<String, dynamic>);
          token = data['token'] as String?;
          refreshToken = data['refreshToken'] as String?;
        } else {
          throw ApiException('Giriş başarısız');
        }
      } else {
        final data = response.data as Map<String, dynamic>;
        user = User.fromJson(data['user'] as Map<String, dynamic>);
        token = data['token'] as String?;
        refreshToken = data['refreshToken'] as String?;
      }

      if (token != null) {
        await _prefs.setString('auth_token', token);
        if (refreshToken != null) {
          await _prefs.setString('refresh_token', refreshToken);
        }
        _apiClient.setAuthToken(token);
      }

      return user;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Giriş yapılırken hata oluştu: ${e.toString()}');
    }
  }

  Future<User> register({
    required String email,
    required String password,
    required String username,
    required String fullName,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: {
          'email': email,
          'password': password,
          'username': username,
          'fullName': fullName,
        },
      );

      User user;
      String? token;
      String? refreshToken;

      if (response.data is Map) {
        final apiResponse = ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => data,
        );

        if (apiResponse.data != null) {
          final data = apiResponse.data as Map<String, dynamic>;
          user = User.fromJson(data['user'] as Map<String, dynamic>);
          token = data['token'] as String?;
          refreshToken = data['refreshToken'] as String?;
        } else {
          throw ApiException('Kayıt başarısız');
        }
      } else {
        final data = response.data as Map<String, dynamic>;
        user = User.fromJson(data['user'] as Map<String, dynamic>);
        token = data['token'] as String?;
        refreshToken = data['refreshToken'] as String?;
      }

      if (token != null) {
        await _prefs.setString('auth_token', token);
        if (refreshToken != null) {
          await _prefs.setString('refresh_token', refreshToken);
        }
        _apiClient.setAuthToken(token);
      }

      return user;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Kayıt olurken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    try {
      await _apiClient.post(ApiEndpoints.logout);
    } catch (e) {
      // Logout hatası olsa bile token'ı temizle
    } finally {
      await _prefs.remove('auth_token');
      await _prefs.remove('refresh_token');
      _apiClient.clearAuthToken();
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final token = _prefs.getString('auth_token');
      if (token == null) return null;

      _apiClient.setAuthToken(token);

      final response = await _apiClient.get(ApiEndpoints.me);

      if (response.data is Map) {
        final apiResponse = ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => data,
        );

        if (apiResponse.data != null) {
          return User.fromJson(apiResponse.data as Map<String, dynamic>);
        }
      }

      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      // Token geçersizse temizle
      await _prefs.remove('auth_token');
      await _prefs.remove('refresh_token');
      _apiClient.clearAuthToken();
      return null;
    }
  }

  String? getToken() => _prefs.getString('auth_token');

  bool get isLoggedIn => _prefs.getString('auth_token') != null;
}
