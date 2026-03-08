class User {
  final String id;
  final String username;
  final String fullName;
  final String profileImageUrl;
  final bool isOnline;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final String? bio;

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profileImageUrl,
    this.isOnline = false,
    this.followersCount = 0,
    this.followingCount = 0,
    this.postsCount = 0,
    this.bio,
  });

  User copyWith({
    String? id,
    String? username,
    String? fullName,
    String? profileImageUrl,
    bool? isOnline,
    int? followersCount,
    int? followingCount,
    int? postsCount,
    String? bio,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isOnline: isOnline ?? this.isOnline,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      postsCount: postsCount ?? this.postsCount,
      bio: bio ?? this.bio,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String? ?? json['full_name'] as String? ?? '',
      profileImageUrl: json['profileImageUrl'] as String? ??
          json['profile_image_url'] as String? ??
          '',
      isOnline: json['isOnline'] as bool? ?? json['is_online'] as bool? ?? false,
      followersCount: json['followersCount'] as int? ??
          json['followers_count'] as int? ??
          0,
      followingCount: json['followingCount'] as int? ??
          json['following_count'] as int? ??
          0,
      postsCount:
          json['postsCount'] as int? ?? json['posts_count'] as int? ?? 0,
      bio: json['bio'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'profileImageUrl': profileImageUrl,
      'isOnline': isOnline,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'postsCount': postsCount,
      'bio': bio,
    };
  }
}
