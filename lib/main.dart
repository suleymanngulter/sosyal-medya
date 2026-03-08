import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/social_media_provider.dart';
import 'screens/home_screen.dart';
import 'utils/timeago_tr.dart';
import 'utils/api_test_helper.dart';
import 'api/api_client.dart';
import 'repositories/post_repository.dart';
import 'repositories/user_repository.dart';
import 'repositories/auth_repository.dart';
import 'config/api_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Türkçe yerelleştirme için timeago ayarları
  timeago.setLocaleMessages('tr', TrMessages());
  
  // Debug modunda API konfigürasyonunu yazdır
  if (kDebugMode) {
    ApiTestHelper.printConfig();
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency injection setup
    final apiClient = ApiClient();
    final prefs = SharedPreferences.getInstance();
    
    // Repository'leri oluştur (async olduğu için FutureBuilder kullanılabilir)
    // Şimdilik null geçiyoruz, provider içinde mock data kullanılacak
    // Gerçek API entegrasyonu için burada repository'leri oluşturup provider'a geçin
    
    return FutureBuilder<SharedPreferences>(
      future: prefs,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        // API kullanmak için repository'leri oluştur
        final postRepository = PostRepository(apiClient);
        final userRepository = UserRepository(apiClient);
        final authRepository = AuthRepository(apiClient, snapshot.data!);

        return ChangeNotifierProvider(
          create: (context) => SocialMediaProvider(
            postRepository: postRepository,
            userRepository: userRepository,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sosyal Medya',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: Colors.grey.shade50,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
              ),
            ),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}


