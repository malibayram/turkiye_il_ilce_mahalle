import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdresAramaSyf extends StatefulWidget {
  final Map gelen;

  const AdresAramaSyf(this.gelen);

  @override
  _AdresAramaSyfState createState() => _AdresAramaSyfState();
}

class _AdresAramaSyfState extends State<AdresAramaSyf> {
  int secili = 0;
  String k = "";
  String aranan = "il";
  String kod = "";
  String kod2 = "";
  Function secim;
  Color barRengi;
  Color yaziRengi;
  bool veriVar = false;
  List liste;
  Map args;

  var headers = {
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Site': 'same-origin',
    'Origin': 'https://adres.nvi.gov.tr',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'tr,ar;q=0.9,tr-TR;q=0.8,en-US;q=0.7,en;q=0.6',
    'User-Agent':
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36',
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    'Accept': '*/*',
    'Referer': 'https://adres.nvi.gov.tr/VatandasIslemleri/AdresSorgu',
    'X-Requested-With': 'XMLHttpRequest',
    'Connection': 'keep-alive',
    '__RequestVerificationToken':
        'kTaxOjzJrcPecdIDtdHAo0iwnkKEdkkciFQT1Iozqg5DWPRBEARFXyOHOducZ57_Val23M6OfyF4VJC2ZLD5A9cuNkM1',
    'Cookie':
        '__RequestVerificationToken=T7zackMfqPKyYpnFXJW3LUANaSNvdp6Q_c-qtkGxFH8Muv53YJ7g4TWQHnW3O0JhD7MSLDsR_PPUaxZubJeEkXE1MYY1; browser-check=%22done%22',
  };

  @override
  void initState() {
    args = widget.gelen;
    aranan = args['liste'];
    kod = args["kod"];
    if (aranan == "bina" || aranan == "daire") kod2 = args["kod2"];
    secim = args['fonksiyon'];

    barRengi = args['bar_rengi'] ?? Colors.blue;
    yaziRengi = args['yazi_rengi'] ?? Colors.white;

    print(aranan);

    listeOlustur();

    super.initState();
  }

  listeOlustur() async {
    veriVar = false;
    setState(() {});
    switch (aranan) {
      case 'ilce':
        if (liste == null) liste = await ilceGetir(kod);
        break;

      case 'mahalle':
        if (liste == null) liste = await mahalleGetir(kod);
        break;

      case 'yol':
        if (liste == null) liste = await yolGetir(kod);
        break;

      case 'bina':
        if (liste == null) liste = await binaGetir(kod, kod2);
        break;

      case 'daire':
        if (liste == null) liste = await daireGetir(kod, kod2);
        break;

      default:
        if (liste == null) liste = await ilGetir();
        break;
    }
    veriVar = true;
    setState(() {});
  }

  Future<List> ilGetir() async {
    http.Response res = await http.post('https://adres.nvi.gov.tr/Harita/ilListesi', headers: headers);
    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else
      return json.decode(res.body);
  }

  Future<List> ilceGetir(String il) async {
    var data = 'ilKimlikNo=$il';

    http.Response res = await http.post(
      'https://adres.nvi.gov.tr/Harita/ilceListesi',
      headers: headers,
      body: data,
    );

    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else {
      print(res.body);
      return json.decode(res.body);
    }
  }

  Future<List> mahalleGetir(String ilce) async {
    var data = 'ilceKimlikNo=$ilce';

    http.Response res = await http.post(
      'https://adres.nvi.gov.tr/Harita/mahalleKoyBaglisiListesi',
      headers: headers,
      body: data,
    );

    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else {
      print(res.body);
      return json.decode(res.body);
    }
  }

  Future<List> yolGetir(String mahalle) async {
    var data = 'mahalleKoyBaglisiKimlikNo=$mahalle';

    http.Response res = await http.post(
      'https://adres.nvi.gov.tr/Harita/yolListesi',
      headers: headers,
      body: data,
    );

    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else {
      print(res.body);
      return json.decode(res.body);
    }
  }

  Future<List> binaGetir(String mahalle, String yol) async {
    var data = 'mahalleKoyBaglisiKimlikNo=$mahalle&yolKimlikNo=$yol';

    http.Response res = await http.post(
      'https://adres.nvi.gov.tr/Harita/binaListesi',
      headers: headers,
      body: data,
    );

    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else {
      print(res.body);
      return json.decode(res.body);
    }
  }

  Future<List> daireGetir(String mahalle, String bina) async {
    var data = 'mahalleKoyBaglisiKimlikNo=$mahalle&binaKimlikNo=$bina';

    http.Response res = await http.post(
      'https://adres.nvi.gov.tr/Harita/bagimsizBolumListesi',
      headers: headers,
      body: data,
    );

    if (res.statusCode != 200) {
      print('post error: statusCode= ${res.statusCode}');
      return [];
    } else {
      print(res.body);
      return json.decode(res.body);
    }
  }

  filtrele(String c) {
    k = c;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: barRengi,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: yaziRengi,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          onChanged: filtrele,
          decoration: InputDecoration(
            hintText: "Arama Yap",
            hintStyle: TextStyle(color: yaziRengi),
          ),
          style: TextStyle(color: yaziRengi),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Tamam",
              style: TextStyle(color: yaziRengi),
            ),
          ),
        ],
      ),
      body: veriVar
          ? ListView.builder(
              itemCount: liste.length,
              itemBuilder: (ctx, i) {
                if (liste[i]['bilesenAdi'].toString().toUpperCase().contains(k.toUpperCase()) ||
                    liste[i]['bilesenAdi'].toString().toLowerCase().contains(k.toLowerCase())) {
                  return ListTile(
                    selected: liste[i]['kimlikNo'] == secili,
                    onTap: () {
                      secili = liste[i]['kimlikNo'];
                      secim(liste[i]);
                      setState(() {});
                    },
                    title: Text(liste[i]['bilesenAdi'] ?? ''),
                    trailing: liste[i]['kimlikNo'] == secili ? Icon(Icons.check) : null,
                  );
                } else {
                  return SizedBox(height: 0);
                }
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
