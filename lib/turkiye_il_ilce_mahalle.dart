library turkiye_il_ilce_mahalle;

import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/aramasayfasi.dart';

class AdresGetir extends StatefulWidget {
  @override
  _AdresGetirState createState() => _AdresGetirState();
}

class _AdresGetirState extends State<AdresGetir> {
  Map _il = {"il": "İl Seçimi Yapın"};
  Map _ilce = {"ilce": "İlçe Seçimi Yapın"};
  Map _koy = {"koy": "Köy Seçimi Yapın"};
  Map _mahalle = {"mahalle": "Mahalle Seçimi Yapın"};

  ilSecimiYap(Map secim) {
    _il = secim;
    _ilce = {"ilce": "İlçe Seçimi Yapın"};
    _koy = {"koy": "Köy Seçimi Yapın"};
    _mahalle = {"mahalle": "Mahalle Seçimi Yapın"};
    print(_il['il']);
  }

  ilceSecimiYap(Map secim) {
    _ilce = secim;
    _koy = {"koy": "Köy Seçimi Yapın"};
    _mahalle = {"mahalle": "Mahalle Seçimi Yapın"};
    print(_ilce.toString());
  }

  koySecimiYap(Map secim) {
    _koy = secim;
    _mahalle = {"mahalle": "Mahalle Seçimi Yapın"};
    print(_koy['koy']);
  }

  mahalleSecimiYap(Map secim) {
    _mahalle = secim;
    print(_mahalle['mahalle']);
  }

  Text baslikil = Text(
    "İl",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Color(0xFF333333),
    ),
  );

  Text baslikilce = Text(
    "İlçe",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Color(0xFF333333),
    ),
  );

  Text baslikkoy = Text(
    "Köy",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Color(0xFF333333),
    ),
  );

  Text baslikmh = Text(
    "Mahalle",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Color(0xFF333333),
    ),
  );

  double genislik = 320;

  Color containerRengi = Colors.white;
  Color cerceveRengi = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: baslikil,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdresAramaSyf({
                      "liste": "il",
                      "kod": "",
                      "fonksiyon": ilSecimiYap,
                    });
                  },
                ),
              );
            },
            child: Container(
              width: genislik,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: containerRengi,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: cerceveRengi),
              ),
              child: Text(_il['il']),
            ),
          ),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: baslikilce,
            ),
          ),
          InkWell(
            onTap: _il['il'] == "İl Seçimi Yapın"
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AdresAramaSyf({
                            "liste": "ilce",
                            "kod": _il['id'],
                            "fonksiyon": ilceSecimiYap
                          });
                        },
                      ),
                    );
                  },
            child: Container(
              width: genislik,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: containerRengi,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: cerceveRengi),
              ),
              child: Text(_ilce['ilce']),
            ),
          ),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: baslikkoy,
            ),
          ),
          InkWell(
            onTap: _ilce['ilce'] == "İlçe Seçimi Yapın"
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AdresAramaSyf({
                            "liste": "koy",
                            "kod": _ilce['id'],
                            "fonksiyon": koySecimiYap
                          });
                        },
                      ),
                    );
                  },
            child: Container(
              width: genislik,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: containerRengi,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: cerceveRengi),
              ),
              child: Text(_koy['koy']),
            ),
          ),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: baslikmh,
            ),
          ),
          InkWell(
            onTap: _koy['koy'] == "Köy Seçimi Yapın"
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AdresAramaSyf({
                            "liste": "mahalle",
                            "kod": _koy['id'],
                            "fonksiyon": mahalleSecimiYap,
                          });
                        },
                      ),
                    );
                  },
            child: Container(
              width: genislik,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: containerRengi,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: cerceveRengi),
              ),
              child: Text(_mahalle['mahalle']),
            ),
          ),
        ],
      ),
    );
  }
}
