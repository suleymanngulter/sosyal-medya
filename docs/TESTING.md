# API Test Rehberi

Bu dokümantasyon, API entegrasyonunu test etmek için adımları içerir.

## 🧪 Test Adımları

### 1. API Base URL'ini Ayarlayın

`lib/config/api_config.dart` dosyasında base URL'i ayarlayın veya environment variable kullanın:

```bash
# Environment variable ile
flutter run --dart-define=API_BASE_URL=https://your-api.com/v1

# Veya kod içinde direkt değiştirin
```

### 2. Uygulamayı Çalıştırın

```bash
flutter run
```

### 3. Debug Console'u Kontrol Edin

Uygulama başladığında console'da şunları göreceksiniz:

```
📋 API Konfigürasyonu:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Base URL: https://your-api.com/v1
Environment: development
Is Production: false
...
```

### 4. Test Senaryoları

#### Senaryo 1: API Bağlantısı Başarılı
- Uygulama açıldığında gönderiler yüklenir
- Kullanıcı profilleri görünür
- Hata mesajı görünmez

#### Senaryo 2: API Bağlantısı Başarısız
- Uygulama otomatik olarak mock data'ya geçer
- Console'da hata mesajı görünür
- Kullanıcı mock data ile devam eder

#### Senaryo 3: API Response Formatı Farklı
- ResponseParser otomatik olarak farklı formatları destekler
- Eğer hala sorun varsa `lib/utils/response_parser.dart` dosyasını kontrol edin

## 🔍 Debug İpuçları

### Console Logları

Debug modunda tüm API istekleri console'da görünür:

```
REQUEST[GET] => PATH: /posts
QueryParameters: {page: 1, limit: 20}
RESPONSE[200] => PATH: /posts
Data: {...}
```

### Hata Ayıklama

1. **Network Hatası:**
   - İnternet bağlantınızı kontrol edin
   - API URL'inin doğru olduğundan emin olun
   - Firewall/CORS ayarlarını kontrol edin

2. **401 Unauthorized:**
   - Token'ın geçerli olduğundan emin olun
   - Login işlemini yapın
   - Token refresh mekanizmasını kontrol edin

3. **404 Not Found:**
   - Endpoint URL'lerini kontrol edin
   - API dokümantasyonunu kontrol edin

4. **Response Format Hatası:**
   - API response formatını kontrol edin
   - `ResponseParser` sınıfını güncelleyin

## 📊 Test Checklist

- [ ] API base URL doğru ayarlandı
- [ ] Repository'ler aktif edildi
- [ ] Uygulama başarıyla çalışıyor
- [ ] Gönderiler yükleniyor
- [ ] Kullanıcı profilleri görünüyor
- [ ] Beğeni işlemi çalışıyor
- [ ] Hata durumunda mock data'ya geçiş yapılıyor
- [ ] Console'da hata mesajı yok

## 🐛 Yaygın Sorunlar ve Çözümler

### Sorun: Mock Data Hala Kullanılıyor

**Çözüm:**
- `lib/main.dart` dosyasında repository'lerin aktif olduğundan emin olun
- API base URL'inin doğru olduğunu kontrol edin
- Network bağlantısını kontrol edin

### Sorun: Response Format Hatası

**Çözüm:**
- API response formatınızı kontrol edin
- `lib/utils/response_parser.dart` dosyasını güncelleyin
- Desteklenen formatlar:
  - `{success: true, data: [...]}`
  - `{data: [...]}`
  - `{posts: [...]}`
  - `[...]` (direkt liste)

### Sorun: Token Sorunları

**Çözüm:**
- Login işlemini yapın
- Token'ın geçerli olduğundan emin olun
- `AuthInterceptor` çalışıyor mu kontrol edin

## ✅ Başarı Kriterleri

API entegrasyonu başarılı sayılır eğer:

1. ✅ Uygulama API'den veri çekiyor
2. ✅ Gönderiler başarıyla yükleniyor
3. ✅ Kullanıcı profilleri görünüyor
4. ✅ Beğeni/yorum işlemleri çalışıyor
5. ✅ Hata durumunda graceful degradation var
6. ✅ Console'da kritik hata yok

## 📝 Notlar

- API yoksa uygulama otomatik olarak mock data kullanır
- Tüm hatalar yakalanır ve kullanıcıya gösterilir
- Debug modunda detaylı loglar görünür
- Production modunda sadece kritik hatalar loglanır
