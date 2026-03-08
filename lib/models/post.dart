import 'user.dart';

class Post {
  final String id;
  final User author;
  final String imageUrl;
  final String caption;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final List<String> likedBy;

  Post({
    required this.id,
    required this.author,
    required this.imageUrl,
    required this.caption,
    required this.createdAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isLiked = false,
    this.likedBy = const [],
  });

  Post copyWith({
    String? id,
    User? author,
    String? imageUrl,
    String? caption,
    DateTime? createdAt,
    int? likesCount,
    int? commentsCount,
    bool? isLiked,
    List<String>? likedBy,
  }) {
    return Post(
      id: id ?? this.id,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLiked: isLiked ?? this.isLiked,
      likedBy: likedBy ?? this.likedBy,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String? ??
          json['image_url'] as String? ??
          '',
      caption: json['caption'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : json['created_at'] != null
              ? DateTime.parse(json['created_at'] as String)
              : DateTime.now(),
      likesCount:
          json['likesCount'] as int? ?? json['likes_count'] as int? ?? 0,
      commentsCount: json['commentsCount'] as int? ??
          json['comments_count'] as int? ??
          0,
      isLiked: json['isLiked'] as bool? ?? json['is_liked'] as bool? ?? false,
      likedBy: json['likedBy'] != null
          ? List<String>.from(json['likedBy'] as List)
          : json['liked_by'] != null
              ? List<String>.from(json['liked_by'] as List)
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author.toJson(),
      'imageUrl': imageUrl,
      'caption': caption,
      'createdAt': createdAt.toIso8601String(),
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'isLiked': isLiked,
      'likedBy': likedBy,
    };
  }
}
