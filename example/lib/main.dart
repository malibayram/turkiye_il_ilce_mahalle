import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/turkiye_il_ilce_mahalle.dart';

main() {
  runApp(
    MaterialApp(
      home: Ornek(),
    ),
  );
}

class Ornek extends StatefulWidget {
  @override
  _OrnekState createState() => _OrnekState();
}

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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "İl",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            // İller arasında seçim yapmak için kullanacağımız Il widgetini oluşturuyoruz
            Il(
              fonksiyon: (Map gelenDeger) {
                /* Map türünde geri dönüş yapacak olan fonksiyonumuzu oluşturuyoruz */
                _ilM =
                    gelenDeger; /* Fonksiyonun döndürdüğü değeri oluşturduğumuz il değişkenine atıyoruz */
                _ilceM = {
                  "ilce": "İlçe Seçimi Yapın"
                }; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _koyM = {
                  "koy": "Köy Seçimi Yapın"
                }; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _mahalleM = {
                  "mahalle": "Mahalle Seçimi Yapın"
                }; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
              },
              child: Text("${_ilM['il']}"),
              /* İstediğimiz herhangi bir widgeti buraya child olarak ekliyoruz */
              barRengi: Colors.amber,
              /* Açılacak olan seçim sayfasının bar ve yazı rengini İSTEĞE BAĞLI olarak değiştiriyoruz -Bu adım zorun değil- */
              yaziRengi: Colors
                  .blue, /* Açılacak olan seçim sayfasının bar ve yazı rengini İSTEĞE BAĞLI olarak değiştiriyoruz -Bu adım zorun değil- */
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "İlçe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Köy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mahalle",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
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
