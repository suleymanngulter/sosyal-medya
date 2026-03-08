import '../models/user.dart';
import '../models/post.dart';
import 'dart:math';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Mock data - gerçek uygulamada API'den gelecek
  List<User> getUsers() {
    return [
      User(
        id: '1',
        username: 'ali_veli',
        fullName: 'Ali Veli',
        profileImageUrl:
            'https://cdn.pixabay.com/photo/2017/11/29/09/15/paint-2985569_1280.jpg',
        isOnline: true,
        followersCount: 1250,
        followingCount: 320,
        postsCount: 45,
        bio: 'Sanatçı ve tasarımcı',
      ),
      User(
        id: '2',
        username: 'ahmet_mehmet',
        fullName: 'Ahmet Mehmet',
        profileImageUrl:
            'https://cdn.pixabay.com/photo/2019/12/16/21/39/tree-4700352_1280.jpg',
        isOnline: false,
        followersCount: 890,
        followingCount: 150,
        postsCount: 32,
        bio: 'Doğa fotoğrafçısı',
      ),
      User(
        id: '3',
        username: 'ayse_fatma',
        fullName: 'Ayşe Fatma',
        profileImageUrl:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
        isOnline: true,
        followersCount: 2100,
        followingCount: 450,
        postsCount: 78,
        bio: 'Yazılım geliştirici',
      ),
      User(
        id: '4',
        username: 'mustafa_kemal',
        fullName: 'Mustafa Kemal',
        profileImageUrl:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
        isOnline: false,
        followersCount: 560,
        followingCount: 200,
        postsCount: 21,
      ),
    ];
  }

  List<Post> getPosts() {
    final users = getUsers();
    final random = Random();

    return [
      Post(
        id: '1',
        author: users[1],
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/04/09/19/45/galata-4115381_1280.jpg',
        caption: 'İstanbul\'un güzel manzarası 🌉',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likesCount: 245,
        commentsCount: 12,
        isLiked: false,
      ),
      Post(
        id: '2',
        author: users[0],
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/11/29/09/15/paint-2985569_1280.jpg',
        caption: 'Yeni çalışmam tamamlandı! 🎨',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        likesCount: 189,
        commentsCount: 8,
        isLiked: true,
      ),
      Post(
        id: '3',
        author: users[2],
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/12/16/21/39/tree-4700352_1280.jpg',
        caption: 'Doğada harika bir gün geçirdim 🌲',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        likesCount: 312,
        commentsCount: 15,
        isLiked: false,
      ),
      Post(
        id: '4',
        author: users[1],
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/04/09/19/45/galata-4115381_1280.jpg',
        caption: 'Gün batımı muhteşemdi 🌅',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        likesCount: 156,
        commentsCount: 6,
        isLiked: true,
      ),
    ];
  }

  User? getUserById(String id) {
    try {
      return getUsers().firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }
}
