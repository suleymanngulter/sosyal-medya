# 📱 Sosyal Medya Uygulaması

Modern Flutter ile geliştirilmiş, tam özellikli sosyal medya uygulaması. Kullanıcılar gönderi paylaşabilir, beğenebilir, yorum yapabilir ve birbirlerini takip edebilir.

[![Flutter](https://img.shields.io/badge/Flutter-3.4+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.4+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-Education-blue)](LICENSE)

## ✨ Özellikler

### 🎨 Kullanıcı Arayüzü
- ✅ Modern Material Design 3 arayüzü
- ✅ Responsive tasarım (mobil uyumlu)
- ✅ Smooth animasyonlar ve geçişler
- ✅ Pull-to-refresh desteği
- ✅ Infinite scroll
- ✅ Loading ve error state'leri

### 👥 Sosyal Özellikler
- ✅ Kullanıcı profilleri ve detay sayfaları
- ✅ Gönderi paylaşma ve görüntüleme
- ✅ Beğeni ve yorum yapma
- ✅ Profil kartları (yatay kaydırma)
- ✅ Çevrimiçi durumu göstergesi
- ✅ Takipçi/takip edilen sayıları

### 🔧 Teknik Özellikler
- ✅ Backend API entegrasyonu hazır
- ✅ Repository Pattern
- ✅ State Management (Provider)
- ✅ Error Handling ve Recovery
- ✅ Authentication Interceptor
- ✅ JSON Serialization
- ✅ Image Caching
- ✅ Türkçe yerelleştirme

## 🚀 Hızlı Başlangıç

### Gereksinimler

- Flutter SDK 3.4.0 veya üzeri
- Dart 3.4.0 veya üzeri
- Android Studio / VS Code
- iOS Simulator / Android Emulator (veya fiziksel cihaz)

### Kurulum

1. **Projeyi klonlayın:**
```bash
git clone <repository-url>
cd sosyal-medya
```

2. **Bağımlılıkları yükleyin:**
```bash
flutter pub get
```

3. **Uygulamayı çalıştırın:**
```bash
flutter run
```

### API Entegrasyonu

API entegrasyonu için detaylı rehber: [docs/API_INTEGRATION.md](docs/API_INTEGRATION.md)

**Hızlı Başlangıç:**
1. `lib/config/api_config.dart` dosyasında base URL'i ayarlayın
2. Repository'ler zaten aktif (mock data fallback ile)
3. API response formatını kontrol edin

## 📁 Proje Yapısı

```
lib/
├── api/                    # API client ve endpoint'ler
│   ├── api_client.dart
│   ├── api_endpoints.dart
│   ├── api_exceptions.dart
│   └── interceptors/       # Auth, Logging interceptors
│
├── config/                 # Konfigürasyon
│   └── api_config.dart
│
├── models/                 # Veri modelleri
│   ├── user.dart
│   ├── post.dart
│   ├── comment.dart
│   └── api_response.dart
│
├── repositories/           # Repository pattern
│   ├── auth_repository.dart
│   ├── post_repository.dart
│   ├── user_repository.dart
│   └── comment_repository.dart
│
├── providers/              # State management
│   └── social_media_provider.dart
│
├── services/               # Servisler
│   └── data_service.dart   # Mock data
│
├── screens/                # Ekranlar
│   ├── home_screen.dart
│   └── profile_screen.dart
│
├── widgets/                # Widget'lar
│   ├── post_card.dart
│   └── profile_card.dart
│
└── utils/                  # Yardımcı sınıflar
    ├── api_test_helper.dart
    ├── response_parser.dart
    └── timeago_tr.dart
```

Detaylı mimari bilgisi için: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

## 🛠️ Teknolojiler

| Kategori | Teknoloji | Açıklama |
|----------|-----------|----------|
| **Framework** | Flutter 3.4+ | Cross-platform framework |
| **Language** | Dart 3.4+ | Programlama dili |
| **State Management** | Provider 6.1+ | State yönetimi |
| **HTTP Client** | Dio 5.4+ | HTTP istekleri |
| **Image Loading** | Cached Network Image 3.3+ | Görsel önbellekleme |
| **Local Storage** | Shared Preferences 2.2+ | Token ve ayar saklama |
| **Time Formatting** | Timeago 3.6+ | Zaman formatlama |
| **UI** | Material Design 3 | Modern UI tasarımı |

## 📱 Ekranlar

### 🏠 Ana Sayfa
- Kullanıcı profil kartları (yatay kaydırma)
- Gönderi akışı (infinite scroll)
- Beğenme, yorum ve paylaşma butonları
- Bildirim ve menü butonları
- Pull-to-refresh

### 👤 Profil Sayfası
- Kullanıcı bilgileri ve istatistikler
- Takipçi, takip edilen ve gönderi sayıları
- Profil fotoğrafı ve çevrimiçi durumu
- Takip et ve mesaj butonları
- Gönderi galerisi (yakında)

## 🔄 Versiyon Geçmişi

### v2.0.0 (Güncel)
- ✅ Modern Flutter yapısına geçiş
- ✅ Null safety desteği
- ✅ Provider ile state management
- ✅ Backend API entegrasyonu hazır
- ✅ Repository pattern implementasyonu
- ✅ Error handling ve exception management
- ✅ Authentication interceptor
- ✅ JSON serialization
- ✅ Pull-to-refresh ve infinite scroll
- ✅ UI/UX modernizasyonu
- ✅ Performans optimizasyonları
- ✅ Cached network images
- ✅ Türkçe yerelleştirme desteği

### v1.0.0
- İlk sürüm (eski kod yapısı)

## 📚 Dokümantasyon

- 📖 [Mimari Dokümantasyonu](docs/ARCHITECTURE.md) - Proje yapısı ve tasarım kararları
- 🔌 [API Entegrasyon Rehberi](docs/API_INTEGRATION.md) - Backend API entegrasyonu
- 🧪 [Test Rehberi](docs/TESTING.md) - Test adımları ve troubleshooting

## 🎨 Tasarım

Uygulama **Material Design 3** prensiplerine uygun olarak tasarlanmıştır:

- Temiz ve minimal arayüz
- Yumuşak gölgeler ve animasyonlar
- Responsive tasarım
- Erişilebilirlik odaklı
- Dark mode desteği (gelecekte)

## 🔌 Backend API

Uygulama backend API entegrasyonu için tamamen hazırdır!

### Mevcut Özellikler
- ✅ API Client (Dio tabanlı)
- ✅ Repository Pattern
- ✅ Error Handling
- ✅ Authentication Interceptor
- ✅ JSON Serialization
- ✅ Mock Data Fallback

### API Özellikleri
- Otomatik token yönetimi
- Optimistic updates (beğeni, yorum)
- Error recovery (API hatası durumunda mock data'ya geçiş)
- Pull-to-refresh
- Infinite scroll

Detaylı bilgi: [docs/API_INTEGRATION.md](docs/API_INTEGRATION.md)

## 🧪 Test

Test rehberi ve troubleshooting için: [docs/TESTING.md](docs/TESTING.md)

### Test Senaryoları
- ✅ API bağlantı testi
- ✅ Mock data fallback testi
- ✅ Error handling testi
- ✅ State management testi

## 📝 Notlar

- Şu anda **mock data** kullanılmaktadır (API entegrasyonu için hazır)
- API aktif edildiğinde otomatik olarak API'den veri çekilir
- Yorum ekranı ve mesajlaşma özellikleri yakında eklenecek
- Offline cache ve push notification desteği planlanmaktadır

## 🤝 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit edin (`git commit -m 'Add amazing feature'`)
4. Push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

## 👨‍💻 Geliştirici

Modern Flutter best practices kullanılarak geliştirilmiştir.

---

⭐ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
