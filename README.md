# Turkiye Il Ilce Mahalle

Türkiye'deki İl, İlçe ve Mahalle verilerini seçmenizi sağlayan, kullanımı kolay ve güncel bir Flutter paketi.

Bu paket, [TurkiyeAPI](https://turkiyeapi.dev/) servisini kullanarak en güncel adres verilerini sağlar.

## Özellikler

- ✅ **Güncel Veriler**: TurkiyeAPI üzerinden anlık ve güncel veriler.
- ✅ **Null Safety**: Tamamen null-safe kod yapısı.
- ✅ **Kolay Kullanım**: `Il`, `Ilce` ve `Mahalle` widget'ları ile hızlı entegrasyon.
- ✅ **Özelleştirilebilir**: Renk ve stil seçenekleri.

## Kurulum

`pubspec.yaml` dosyanıza paketi ekleyin:

```yaml
dependencies:
  turkiye_il_ilce_mahalle: ^0.3.0
```

## Kullanım

Paketi projenize dahil edin:

```dart
import 'package:turkiye_il_ilce_mahalle/turkiye_il_ilce_mahalle.dart';
```

### Temel Kullanım

Adres seçimi için `Il`, `Ilce` ve `Mahalle` widget'larını sırasıyla kullanabilirsiniz.

```dart
// Seçilen değerleri tutmak için değişkenler
Map<String, dynamic> _il = {"bilesenAdi": "İl Seçimi Yapın"};
Map<String, dynamic> _ilce = {"bilesenAdi": "İlçe Seçimi Yapın"};
Map<String, dynamic> _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};

// İl Seçimi
Il(
  fonksiyon: (Map<String, dynamic> gelenDeger) {
    setState(() {
      _il = gelenDeger;
      // İl değişince alt seçimleri sıfırla
      _ilce = {"bilesenAdi": "İlçe Seçimi Yapın"};
      _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};
    });
  },
  child: Text(_il['bilesenAdi']),
),

// İlçe Seçimi (İl seçildikten sonra gösterilmesi önerilir)
if (_il['bilesenAdi'] != "İl Seçimi Yapın")
  Ilce(
    ilVarMi: true,
    ilKodu: _il['kimlikNo'].toString(),
    fonksiyon: (Map<String, dynamic> gelenDeger) {
      setState(() {
        _ilce = gelenDeger;
        // İlçe değişince mahalleyi sıfırla
        _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};
      });
    },
    child: Text(_ilce['bilesenAdi']),
  ),

// Mahalle Seçimi (İlçe seçildikten sonra gösterilmesi önerilir)
if (_ilce['bilesenAdi'] != "İlçe Seçimi Yapın")
  Mahalle(
    ilceVarMi: true,
    ilceKodu: _ilce['kimlikNo'].toString(),
    fonksiyon: (Map<String, dynamic> gelenDeger) {
      setState(() {
        _mahalle = gelenDeger;
      });
    },
    child: Text(_mahalle['bilesenAdi']),
  ),
```

## Veri Yapısı

Seçim fonksiyonlarından dönen `Map<String, dynamic>` verisi şu yapıdadır:

```dart
{
  "kimlikNo": "12345", // ID
  "bilesenAdi": "Örnek Mahallesi" // İsim
}
```

## Katkıda Bulunma

Hata bildirimleri ve özellik istekleri için lütfen [GitHub Issues](https://github.com/malibayram91/turkiye_il_ilce_mahalle/issues) sayfasını kullanın.

## Lisans

MIT License
