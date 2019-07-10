# turkiye_il_ilce_mahalle
Türkiye İl İlçe Köy Mahalle veritabanına bağlı olarak adres seçme flutter paketi

Flutter paketini kullanmak için
- [buradan buyrun](https://pub.dev/packages/turkiye_il_ilce_mahalle)

## How to use
Paketi aşağıdaki şekilde kullanabilirsiniz.

```dart
class _OrnekState extends State<Ornek> {
  // Öncelikle Map tipinde il, ilçe, köy ve mahalle değişkenlerimizi tanımlıyoruz
  Map _ilM = {"il": "İl Seçimi Yapın"};
  Map _ilceM = {"ilce": "İlçe Seçimi Yapın"};
  Map _koyM = {"koy": "Köy Seçimi Yapın"};
  Map _mahalleM = {"mahalle": "Mahalle Seçimi Yapın"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Seçimi"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // İller arasında seçim yapmak için kullanacağımız Il widgetini oluşturuyoruz
            Il(
              fonksiyon: (Map gelenDeger) { /* Map türünde geri dönüş yapacak olan fonksiyonumuzu oluşturuyoruz */
                _ilM = gelenDeger; /* Fonksiyonun döndürdüğü değeri oluşturduğumuz il değişkenine atıyoruz */
                _ilceM = {"ilce": "İlçe Seçimi Yapın"}; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _koyM = {"koy": "Köy Seçimi Yapın"}; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _mahalleM = {"mahalle": "Mahalle Seçimi Yapın"}; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
              },
              child: Text("${_ilM['il']}"), /* İstediğimiz herhangi bir widgeti buraya child olarak ekliyoruz */
              barRengi: Colors.amber, /* Açılacak olan seçim sayfasının bar ve yazı rengini İSTEĞE BAĞLI olarak değiştiriyoruz -Bu adım zorun değil- */
              yaziRengi: Colors.blue, /* Açılacak olan seçim sayfasının bar ve yazı rengini İSTEĞE BAĞLI olarak değiştiriyoruz -Bu adım zorun değil- */
            ),
            Ilce(
              ilVarMi: _ilM['il'] != "İl Seçimi Yapın",
              ilKodu: _ilM['id'],
              fonksiyon: (Map gelenDeger) {
                _ilceM = gelenDeger;
                _koyM = {"koy": "Köy Seçimi Yapın"};
                _mahalleM = {"mahalle": "Mahalle Seçimi Yapın"};
              },
              child: Text("${_ilceM['ilce']}"),
            ),
            Koy(
              ilceVarMi: _ilceM['ilce'] != "İlçe Seçimi Yapın",
              ilceKodu: _ilceM['id'],
              fonksiyon: (Map gelenDeger) {
                _koyM = gelenDeger;
                _mahalleM = {"mahalle": "Mahalle Seçimi Yapın"};
              },
              child: Text("${_koyM['koy']}"),
            ),
            Mahalle(
              koyVarMi: _koyM['koy'] != "Köy Seçimi Yapın",
              koyKodu: _koyM['id'],
              fonksiyon: (Map gelenDeger) {
                _mahalleM = gelenDeger;
              },
              child: Text("${_mahalleM['mahalle']}"),
            ),
          ],
        ),
      ),
    );
  }
}
 ```