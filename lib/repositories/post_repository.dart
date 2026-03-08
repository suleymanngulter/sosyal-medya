import 'dart:convert';
import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../models/post.dart';
import '../models/api_response.dart';
import '../utils/response_parser.dart';

class PostRepository {
  final ApiClient _apiClient;

  PostRepository(this._apiClient);

  Future<List<Post>> getPosts({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.getPosts,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      // ResponseParser ile farklı formatları destekle
      return ResponseParser.parsePosts(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Gönderiler yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<Post> getPost(String postId) async {
    try {
      final response = await _apiClient.get(ApiEndpoints.getPost(postId));
      return ResponseParser.parsePost(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Gönderi yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<Post> createPost({
    required String imageUrl,
    required String caption,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.createPost,
        data: {
          'imageUrl': imageUrl,
          'caption': caption,
        },
      );

      return ResponseParser.parsePost(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Gönderi oluşturulurken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> likePost(String postId) async {
    try {
      await _apiClient.post(ApiEndpoints.likePost(postId));
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Gönderi beğenilirken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> unlikePost(String postId) async {
    try {
      await _apiClient.delete(ApiEndpoints.unlikePost(postId));
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
          'Gönderi beğenisi kaldırılırken hata oluştu: ${e.toString()}');
    }
  }

  Future<List<Post>> getFeed({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.getFeed,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      return ResponseParser.parsePosts(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Feed yüklenirken hata oluştu: ${e.toString()}');
    }
  }
}
