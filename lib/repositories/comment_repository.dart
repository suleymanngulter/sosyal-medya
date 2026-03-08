import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../models/comment.dart';
import '../models/api_response.dart';
import '../utils/response_parser.dart';

class CommentRepository {
  final ApiClient _apiClient;

  CommentRepository(this._apiClient);

  Future<List<Comment>> getPostComments(String postId) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.getPostComments(postId),
      );

      return ResponseParser.parseComments(response.data);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Yorumlar yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<Comment> addComment(String postId, String content) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.addComment(postId),
        data: {'content': content},
      );

      if (response.data is Map) {
        final apiResponse = ApiResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => data,
        );

        if (apiResponse.data != null) {
          return Comment.fromJson(
            apiResponse.data as Map<String, dynamic>,
          );
        }
      }

      return Comment.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Yorum eklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<void> deleteComment(String postId, String commentId) async {
    try {
      await _apiClient.delete(
        ApiEndpoints.deleteComment(postId, commentId),
      );
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException('Yorum silinirken hata oluştu: ${e.toString()}');
    }
  }
}
