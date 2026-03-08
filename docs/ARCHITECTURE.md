# Mimari Dokümantasyonu

Bu dokümantasyon, sosyal medya uygulamasının mimari yapısını ve tasarım kararlarını açıklar.

## 🏗️ Genel Mimari

Uygulama **Clean Architecture** prensiplerine uygun olarak tasarlanmıştır:

```
┌─────────────────────────────────────────┐
│           Presentation Layer              │
│  (Screens, Widgets, Providers)           │
└─────────────────┬─────────────────────────┘
                  │
┌─────────────────▼─────────────────────────┐
│            Domain Layer                   │
│      (Models, Repositories)              │
└─────────────────┬─────────────────────────┘
                  │
┌─────────────────▼─────────────────────────┐
│            Data Layer                     │
│  (API Client, Services, Interceptors)    │
└──────────────────────────────────────────┘
```

## 📁 Klasör Yapısı

```
lib/
├── api/                    # API Katmanı
│   ├── api_client.dart     # HTTP client wrapper
│   ├── api_endpoints.dart  # Endpoint tanımları
│   ├── api_exceptions.dart # Hata yönetimi
│   └── interceptors/      # Request/Response interceptors
│       ├── auth_interceptor.dart
│       └── logging_interceptor.dart
│
├── config/                 # Konfigürasyon
│   └── api_config.dart     # API ayarları
│
├── models/                 # Veri Modelleri
│   ├── user.dart
│   ├── post.dart
│   ├── comment.dart
│   └── api_response.dart
│
├── repositories/            # Repository Pattern
│   ├── auth_repository.dart
│   ├── post_repository.dart
│   ├── user_repository.dart
│   └── comment_repository.dart
│
├── providers/              # State Management
│   └── social_media_provider.dart
│
├── services/               # Servisler
│   └── data_service.dart   # Mock data servisi
│
├── screens/                # Ekranlar
│   ├── home_screen.dart
│   └── profile_screen.dart
│
├── widgets/                # Yeniden Kullanılabilir Widget'lar
│   ├── post_card.dart
│   └── profile_card.dart
│
└── utils/                  # Yardımcı Sınıflar
    ├── api_test_helper.dart
    ├── response_parser.dart
    └── timeago_tr.dart
```

## 🔄 Veri Akışı

### 1. API İsteği Akışı

```
UI (Widget)
    ↓
Provider (State Management)
    ↓
Repository (Business Logic)
    ↓
API Client (HTTP Request)
    ↓
Interceptor (Auth, Logging)
    ↓
Backend API
```

### 2. Veri Dönüş Akışı

```
Backend API
    ↓
API Client (Response)
    ↓
Response Parser (Format Conversion)
    ↓
Repository (Data Transformation)
    ↓
Provider (State Update)
    ↓
UI (Widget Rebuild)
```

## 🎯 Tasarım Desenleri

### 1. Repository Pattern

Repository'ler, veri kaynaklarından (API, Local DB) bağımsız bir interface sağlar:

```dart
class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> createPost();
  Future<void> likePost(String postId);
}
```

**Avantajları:**
- Test edilebilirlik
- Veri kaynağı değişikliğinde kolay güncelleme
- Business logic'in merkezi yönetimi

### 2. Provider Pattern (State Management)

Provider, uygulama genelinde state yönetimi sağlar:

```dart
class SocialMediaProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  
  Future<void> loadPosts() async { ... }
}
```

**Avantajları:**
- Merkezi state yönetimi
- Reactive UI updates
- Kolay test edilebilirlik

### 3. Dependency Injection

Bağımlılıklar constructor injection ile sağlanır:

```dart
SocialMediaProvider(
  postRepository: PostRepository(apiClient),
  userRepository: UserRepository(apiClient),
)
```

## 🔐 Güvenlik

### Authentication

- Token-based authentication
- Otomatik token refresh
- Secure token storage (SharedPreferences)
- Auth interceptor ile otomatik token ekleme

### Error Handling

- Merkezi exception yönetimi
- Kullanıcı dostu hata mesajları
- Graceful degradation (API hatası durumunda mock data)
- Network error recovery

## 📊 Performans Optimizasyonları

### 1. Image Caching

- `CachedNetworkImage` ile görsel önbellekleme
- Placeholder ve error widget'ları
- Lazy loading

### 2. State Management

- Optimistic updates (beğeni, yorum)
- Lazy loading (infinite scroll)
- Pull-to-refresh

### 3. Network Optimization

- Request timeout ayarları
- Connection pooling
- Response caching (gelecekte)

## 🧪 Test Stratejisi

### Unit Tests
- Repository'ler
- Models
- Utils

### Widget Tests
- Widget'lar
- Screens

### Integration Tests
- API entegrasyonu
- State management
- User flows

## 🔮 Gelecek Geliştirmeler

- [ ] Offline cache (Hive/SQLite)
- [ ] Push notifications
- [ ] Real-time updates (WebSocket)
- [ ] Image upload
- [ ] Video support
- [ ] Story feature
- [ ] Direct messaging
- [ ] Search functionality

## 📚 İlgili Dokümantasyon

- [API Entegrasyon Rehberi](./API_INTEGRATION.md)
- [Test Rehberi](./TESTING.md)
- [README](../README.md)
