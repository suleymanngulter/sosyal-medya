class ApiEndpoints {
  static const String baseUrl = ApiConfig.baseUrl;

  // Authentication
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';

  // Users
  static String getUser(String userId) => '/users/$userId';
  static const String getUsers = '/users';
  static const String updateProfile = '/users/profile';
  static String followUser(String userId) => '/users/$userId/follow';
  static String unfollowUser(String userId) => '/users/$userId/unfollow';
  static String getUserFollowers(String userId) => '/users/$userId/followers';
  static String getUserFollowing(String userId) => '/users/$userId/following';

  // Posts
  static const String getPosts = '/posts';
  static String getPost(String postId) => '/posts/$postId';
  static const String createPost = '/posts';
  static String updatePost(String postId) => '/posts/$postId';
  static String deletePost(String postId) => '/posts/$postId';
  static String likePost(String postId) => '/posts/$postId/like';
  static String unlikePost(String postId) => '/posts/$postId/unlike';
  static String getPostComments(String postId) => '/posts/$postId/comments';
  static String addComment(String postId) => '/posts/$postId/comments';
  static String deleteComment(String postId, String commentId) =>
      '/posts/$postId/comments/$commentId';

  // Feed
  static const String getFeed = '/feed';
  static const String getExplore = '/explore';

  // Search
  static const String searchUsers = '/search/users';
  static const String searchPosts = '/search/posts';
}
