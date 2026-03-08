import '../models/api_response.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../models/comment.dart';

/// API response'larını parse etmek için yardımcı sınıf
/// Farklı API formatlarını destekler
class ResponseParser {
  /// Post listesini parse et
  static List<Post> parsePosts(dynamic data) {
    if (data == null) return [];

    // Format 1: ApiResponse wrapper içinde
    if (data is Map<String, dynamic>) {
      final apiResponse = ApiResponse.fromJson(
        data,
        (data) => data,
      );

      if (apiResponse.data is List) {
        return (apiResponse.data as List)
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      // Format 2: Direkt data içinde liste
      if (data['data'] is List) {
        return (data['data'] as List)
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      // Format 3: Direkt data içinde posts
      if (data['posts'] is List) {
        return (data['posts'] as List)
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    }

    // Format 4: Direkt liste
    if (data is List) {
      return data
          .map((json) => Post.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  /// Tek bir post parse et
  static Post parsePost(dynamic data) {
    if (data is Map<String, dynamic>) {
      // ApiResponse wrapper içinde
      if (data['data'] != null) {
        final apiResponse = ApiResponse.fromJson(data, (data) => data);
        if (apiResponse.data != null) {
          return Post.fromJson(apiResponse.data as Map<String, dynamic>);
        }
      }

      // Direkt post
      return Post.fromJson(data);
    }

    throw Exception('Invalid post data format');
  }

  /// User listesini parse et
  static List<User> parseUsers(dynamic data) {
    if (data == null) return [];

    if (data is Map<String, dynamic>) {
      if (data['data'] is List) {
        return (data['data'] as List)
            .map((json) => User.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      if (data['users'] is List) {
        return (data['users'] as List)
            .map((json) => User.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    }

    if (data is List) {
      return data
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  /// Tek bir user parse et
  static User parseUser(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data['data'] != null) {
        final apiResponse = ApiResponse.fromJson(data, (data) => data);
        if (apiResponse.data != null) {
          return User.fromJson(apiResponse.data as Map<String, dynamic>);
        }
      }

      return User.fromJson(data);
    }

    throw Exception('Invalid user data format');
  }

  /// Comment listesini parse et
  static List<Comment> parseComments(dynamic data) {
    if (data == null) return [];

    if (data is Map<String, dynamic>) {
      if (data['data'] is List) {
        return (data['data'] as List)
            .map((json) => Comment.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      if (data['comments'] is List) {
        return (data['comments'] as List)
            .map((json) => Comment.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    }

    if (data is List) {
      return data
          .map((json) => Comment.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  }
}
