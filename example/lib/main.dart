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
  Map _ilM = {"bilesenAdi": "İl Seçimi Yapın"};
  Map _ilceM = {"bilesenAdi": "İlçe Seçimi Yapın"};
  Map _mahalleM = {"bilesenAdi": "Mahalle Seçimi Yapın"};
  Map _yolM = {"bilesenAdi": "Yol Seçimi Yapın"};
  Map _binaM = {"bilesenAdi": "Bina Seçimi Yapın"};
  Map _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};

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
                print(gelenDeger.toString());
                /* Map türünde geri dönüş yapacak olan fonksiyonumuzu oluşturuyoruz */
                _ilM = gelenDeger; /* Fonksiyonun döndürdüğü değeri oluşturduğumuz il değişkenine atıyoruz */
                _ilceM = {
                  "bilesenAdi": "İlçe Seçimi Yapın"
                }; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _mahalleM = {
                  "bilesenAdi": "Mahalle Seçimi Yapın"
                }; /* Daha önce seçim yapılmış olma ihtimaline binaen seçimi sıfırlıyoruz */
                _yolM = {"bilesenAdi": "Yol Seçimi Yapın"};
                _binaM = {"bilesenAdi": "Bina Seçimi Yapın"};
                _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};
                setState(() {});
              },
              child: Text("${_ilM['bilesenAdi']}"),
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
              ilVarMi: _ilM['bilesenAdi'] != "İl Seçimi Yapın",
              ilKodu: "${_ilM['kimlikNo']}",
              fonksiyon: (Map gelenDeger) {
                _ilceM = gelenDeger;
                _mahalleM = {"bilesenAdi": "Mahalle Seçimi Yapın"};
                _yolM = {"bilesenAdi": "Yol Seçimi Yapın"};
                _binaM = {"bilesenAdi": "Bina Seçimi Yapın"};
                _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};
                setState(() {});
              },
              child: Text("${_ilceM['bilesenAdi']}"),
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
              ilceVarMi: _ilceM['bilesenAdi'] != "İlce Seçimi Yapın",
              ilceKodu: "${_ilceM['kimlikNo']}",
              fonksiyon: (Map gelenDeger) {
                _mahalleM = gelenDeger;
                _yolM = {"bilesenAdi": "Yol Seçimi Yapın"};
                _binaM = {"bilesenAdi": "Bina Seçimi Yapın"};
                _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};
                setState(() {});
              },
              child: Text("${_mahalleM['bilesenAdi']}"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yol",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            Yol(
              mahalleVarMi: _mahalleM['bilesenAdi'] != "Mahalle Seçimi Yapın",
              mahalleKodu: "${_mahalleM['kimlikNo']}",
              fonksiyon: (Map gelenDeger) {
                _yolM = gelenDeger;
                _binaM = {"bilesenAdi": "Bina Seçimi Yapın"};
                _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};
                setState(() {});
              },
              child: Text("${_yolM['bilesenAdi']}"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bina",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            Bina(
              mahalleVarMi: _mahalleM['bilesenAdi'] != "Mahalle Seçimi Yapın",
              mahalleKodu: "${_mahalleM['kimlikNo']}",
              yolVarMi: _yolM['bilesenAdi'] != "Yol Seçimi Yapın",
              yolKodu: "${_yolM['kimlikNo']}",
              fonksiyon: (Map gelenDeger) {
                _binaM = gelenDeger;
                _daireM = {"bilesenAdi": "Daire Seçimi Yapın"};
                setState(() {});
              },
              child: Text("${_binaM['bilesenAdi']}"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Daire",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            Daire(
              mahalleVarMi: _mahalleM['bilesenAdi'] != "Mahalle Seçimi Yapın",
              mahalleKodu: "${_mahalleM['kimlikNo']}",
              binaVarMi: _binaM['bilesenAdi'] != "Yol Seçimi Yapın",
              binaKodu: "${_binaM['kimlikNo']}",
              fonksiyon: (Map gelenDeger) {
                _daireM = gelenDeger;
                setState(() {});
              },
              child: Text("${_daireM['bilesenAdi']}"),
            ),
          ],
        ),
      ),
    );
  }
}
