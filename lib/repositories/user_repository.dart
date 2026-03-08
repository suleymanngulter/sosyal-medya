import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../models/user.dart';
import '../models/api_response.dart';
import '../utils/response_parser.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<List<User>> getUsers({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.getUsers,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      return ResponseParser.parseUsers(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Kullanıcılar yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<User> getUser(String userId) async {
    try {
      final response = await _apiClient.get(ApiEndpoints.getUser(userId));
      return ResponseParser.parseUser(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Kullanıcı yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<User> updateProfile({
    String? fullName,
    String? bio,
    String? profileImageUrl,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (fullName != null) data['fullName'] = fullName;
      if (bio != null) data['bio'] = bio;
      if (profileImageUrl != null) data['profileImageUrl'] = profileImageUrl;

      final response = await _apiClient.put(
        ApiEndpoints.updateProfile,
        data: data,
      );

      return ResponseParser.parseUser(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
          'Profil güncellenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> followUser(String userId) async {
    try {
      await _apiClient.post(ApiEndpoints.followUser(userId));
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Kullanıcı takip edilirken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> unfollowUser(String userId) async {
    try {
      await _apiClient.delete(ApiEndpoints.unfollowUser(userId));
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
          'Kullanıcı takipten çıkarılırken hata oluştu: ${e.toString()}');
    }
  }
}
