import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../models/post.dart';
import '../services/data_service.dart';
import '../repositories/post_repository.dart';
import '../repositories/user_repository.dart';
import '../api/api_exceptions.dart';

class SocialMediaProvider with ChangeNotifier {
  final PostRepository? _postRepository;
  final UserRepository? _userRepository;
  final DataService _dataService = DataService();

  List<User> _users = [];
  List<Post> _posts = [];
  User? _currentUser;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _useMockData = false;

  List<User> get users => _users;
  List<Post> get posts => _posts;
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;
  bool get hasMore => _hasMore;

  SocialMediaProvider({
    PostRepository? postRepository,
    UserRepository? userRepository,
  })  : _postRepository = postRepository,
        _userRepository = userRepository {
    // API repository'leri yoksa mock data kullan
    _useMockData = _postRepository == null || _userRepository == null;
    _loadData();
  }

  Future<void> _loadData() async {
    if (_useMockData) {
      _loadMockData();
      return;
    }

    await loadPosts();
    await loadUsers();
  }

  void _loadMockData() {
    _users = _dataService.getUsers();
    _posts = _dataService.getPosts();
    _currentUser = _users.isNotEmpty ? _users[0] : null;
    notifyListeners();
  }

  Future<void> loadPosts({bool refresh = false}) async {
    if (_useMockData) {
      _loadMockData();
      return;
    }

    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      _posts = [];
    }

    if (!_hasMore && !refresh) return;

    _isLoading = refresh;
    _isLoadingMore = !refresh;
    _error = null;
    notifyListeners();

    try {
      final newPosts = await _postRepository!.getPosts(page: _currentPage);
      
      if (refresh) {
        _posts = newPosts;
      } else {
        _posts.addAll(newPosts);
      }

      _hasMore = newPosts.length >= 20; // Limit kadar gelirse daha fazla var
      _currentPage++;
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      // API hatası durumunda mock data'ya fallback
      if (_posts.isEmpty) {
        _useMockData = true;
        _loadMockData();
      }
    } catch (e) {
      _error = 'Gönderiler yüklenirken hata oluştu: ${e.toString()}';
      if (_posts.isEmpty) {
        _useMockData = true;
        _loadMockData();
      }
    } finally {
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> loadUsers() async {
    if (_useMockData) return;

    try {
      _users = await _userRepository!.getUsers();
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      // API hatası durumunda mock data'ya fallback
      if (_users.isEmpty) {
        _users = _dataService.getUsers();
      }
    } catch (e) {
      _error = 'Kullanıcılar yüklenirken hata oluştu: ${e.toString()}';
      if (_users.isEmpty) {
        _users = _dataService.getUsers();
      }
    } finally {
      notifyListeners();
    }
  }

  Future<void> toggleLikePost(String postId) async {
    final index = _posts.indexWhere((post) => post.id == postId);
    if (index == -1) return;

    final post = _posts[index];
    final wasLiked = post.isLiked;

    // Optimistic update
    _posts[index] = post.copyWith(
      isLiked: !wasLiked,
      likesCount: wasLiked ? post.likesCount - 1 : post.likesCount + 1,
    );
    notifyListeners();

    if (_useMockData || _postRepository == null) return;

    try {
      if (wasLiked) {
        await _postRepository!.unlikePost(postId);
      } else {
        await _postRepository!.likePost(postId);
      }
    } catch (e) {
      // Rollback on error
      _posts[index] = post;
      notifyListeners();
      if (kDebugMode) {
        print('Beğeni hatası: $e');
      }
    }
  }

  Future<void> addComment(String postId) async {
    final index = _posts.indexWhere((post) => post.id == postId);
    if (index == -1) return;

    final post = _posts[index];

    // Optimistic update
    _posts[index] = post.copyWith(
      commentsCount: post.commentsCount + 1,
    );
    notifyListeners();

    if (_useMockData || _postRepository == null) return;

    // Gerçek yorum ekleme işlemi CommentRepository ile yapılacak
    // Şimdilik sadece sayıyı artırıyoruz
  }

  void sharePost(String postId) {
    if (kDebugMode) {
      print('Post paylaşıldı: $postId');
    }
    // Paylaşım işlevselliği buraya eklenecek
  }

  Future<User?> getUserById(String id) async {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      // Kullanıcı listede yoksa API'den çek
      if (!_useMockData && _userRepository != null) {
        try {
          return await _userRepository!.getUser(id);
        } catch (e) {
          return null;
        }
      }
      return null;
    }
  }

  Future<void> refresh() async {
    await loadPosts(refresh: true);
    await loadUsers();
  }
}
