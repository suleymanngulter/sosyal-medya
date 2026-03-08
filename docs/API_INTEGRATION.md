# Backend API Entegrasyon Rehberi

Bu dokümantasyon, sosyal medya uygulamasına backend API entegrasyonunun nasıl yapılacağını açıklar.

## 📋 İçindekiler

1. [Mevcut Durum](#mevcut-durum)
2. [API Yapısı](#api-yapısı)
3. [Entegrasyon Adımları](#entegrasyon-adımları)
4. [API Endpoint'leri](#api-endpointleri)
5. [Örnek Kullanım](#örnek-kullanım)

## 🔄 Mevcut Durum

Uygulama şu anda **mock data** kullanarak çalışmaktadır. API entegrasyonu için gerekli tüm yapı hazırdır:

- ✅ API Client (Dio tabanlı)
- ✅ Repository Pattern
- ✅ Error Handling
- ✅ Authentication Interceptor
- ✅ JSON Serialization
- ✅ Provider State Management

## 🏗️ API Yapısı

### Klasör Yapısı

```
lib/
├── api/
│   ├── api_client.dart          # HTTP client wrapper
│   ├── api_endpoints.dart       # Endpoint tanımları
│   ├── api_exceptions.dart      # Hata yönetimi
│   └── interceptors/
│       ├── auth_interceptor.dart
│       └── logging_interceptor.dart
├── repositories/
│   ├── auth_repository.dart
│   ├── post_repository.dart
│   ├── user_repository.dart
│   └── comment_repository.dart
├── models/
│   ├── user.dart
│   ├── post.dart
│   ├── comment.dart
│   └── api_response.dart
└── config/
    └── api_config.dart
```

## 🚀 Entegrasyon Adımları

### 1. API Base URL'ini Ayarlayın

`lib/config/api_config.dart` dosyasında base URL'i güncelleyin:

```dart
static const String baseUrl = 'https://your-api-domain.com/v1';
```

Veya environment variable kullanın:

```bash
flutter run --dart-define=API_BASE_URL=https://your-api-domain.com/v1
```

### 2. Main.dart'ta Repository'leri Aktif Edin

`lib/main.dart` dosyasını açın ve yorum satırlarını kaldırın:

```dart
// Bu satırları bulun:
/*
final postRepository = PostRepository(apiClient);
final userRepository = UserRepository(apiClient);
final authRepository = AuthRepository(apiClient, snapshot.data!);
*/

// Yorumları kaldırıp provider'a geçin:
return ChangeNotifierProvider(
  create: (context) => SocialMediaProvider(
    postRepository: postRepository,
    userRepository: userRepository,
  ),
  // ...
);
```

### 3. API Response Formatını Kontrol Edin

API'nizin response formatı şu şekilde olmalıdır:

**Başarılı Response:**
```json
{
  "success": true,
  "data": { ... },
  "message": "İşlem başarılı"
}
```

**Hata Response:**
```json
{
  "success": false,
  "message": "Hata mesajı",
  "errors": { ... }
}
```

Eğer API'niz farklı bir format kullanıyorsa, repository'lerdeki `fromJson` metodlarını güncelleyin.

### 4. Authentication

Token yönetimi otomatik olarak yapılmaktadır:

- Login/Register sonrası token otomatik kaydedilir
- Her request'e token otomatik eklenir
- 401 hatası durumunda token otomatik temizlenir

## 📡 API Endpoint'leri

### Authentication

- `POST /auth/login` - Giriş yap
- `POST /auth/register` - Kayıt ol
- `POST /auth/refresh` - Token yenile
- `POST /auth/logout` - Çıkış yap
- `GET /auth/me` - Mevcut kullanıcı bilgisi

### Users

- `GET /users` - Kullanıcı listesi
- `GET /users/:id` - Kullanıcı detayı
- `PUT /users/profile` - Profil güncelle
- `POST /users/:id/follow` - Kullanıcıyı takip et
- `DELETE /users/:id/unfollow` - Takibi bırak

### Posts

- `GET /posts` - Gönderi listesi (query: page, limit)
- `GET /posts/:id` - Gönderi detayı
- `POST /posts` - Gönderi oluştur
- `POST /posts/:id/like` - Gönderiyi beğen
- `DELETE /posts/:id/unlike` - Beğeniyi kaldır
- `GET /posts/:id/comments` - Yorumları getir
- `POST /posts/:id/comments` - Yorum ekle

### Feed

- `GET /feed` - Kullanıcı feed'i (query: page, limit)
- `GET /explore` - Keşfet sayfası

## 💡 Örnek Kullanım

### API'yi Aktif Etmek

1. `lib/main.dart` dosyasını açın
2. Repository oluşturma kodlarının yorumlarını kaldırın
3. Provider'a repository'leri geçin

```dart
final postRepository = PostRepository(apiClient);
final userRepository = UserRepository(apiClient);

return ChangeNotifierProvider(
  create: (context) => SocialMediaProvider(
    postRepository: postRepository,
    userRepository: userRepository,
  ),
  // ...
);
```

### Custom Endpoint Ekleme

Yeni bir endpoint eklemek için:

1. `lib/api/api_endpoints.dart` dosyasına ekleyin:
```dart
static const String myNewEndpoint = '/my-endpoint';
```

2. İlgili repository'ye metod ekleyin:
```dart
Future<MyModel> getMyData() async {
  final response = await _apiClient.get(ApiEndpoints.myNewEndpoint);
  return MyModel.fromJson(response.data);
}
```

### Error Handling

Hatalar otomatik olarak yakalanır ve kullanıcıya gösterilir:

```dart
try {
  await provider.loadPosts();
} on ApiException catch (e) {
  // Hata mesajı: e.message
  // Status code: e.statusCode
}
```

## 🔧 Troubleshooting

### Mock Data Hala Kullanılıyor

- `lib/main.dart`'ta repository'lerin provider'a geçildiğinden emin olun
- API base URL'inin doğru olduğunu kontrol edin
- Network bağlantısını kontrol edin

### 401 Unauthorized Hatası

- Token'ın geçerli olduğundan emin olun
- Login işlemini tekrar yapın
- Token refresh mekanizmasını kontrol edin

### Response Format Hatası

- API response formatını kontrol edin
- Repository'lerdeki `fromJson` metodlarını güncelleyin
- `ApiResponse` wrapper'ını kullanın

## 📝 Notlar

- Uygulama API yoksa otomatik olarak mock data'ya geçer
- Tüm network hataları yakalanır ve kullanıcıya gösterilir
- Optimistic updates kullanılır (beğeni, yorum vb.)
- Pull-to-refresh ve infinite scroll desteklenir

## 🎯 Sonraki Adımlar

1. ✅ API entegrasyonu tamamlandı
2. ⏳ Authentication ekranları eklenebilir
3. ⏳ Yorum ekranı geliştirilebilir
4. ⏳ Offline cache eklenebilir
5. ⏳ Push notification entegrasyonu
