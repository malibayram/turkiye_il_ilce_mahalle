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
  String _il;
  String _ilce;
  String _koy;
  String _mahalle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Seçimi"),
      ),
      body: Container(
        child: AdresGetir(
          il: (il) {
            _il = il;
            print("il seçimi tamamlandı: $il");
          },
          ilce: (ilce) {
            _ilce = ilce;
            print("il seçimi tamamlandı: $ilce");
          },
          koy: (koy) {
            _koy = koy;
            print("il seçimi tamamlandı: $koy");
          },
          mahalle: (mahalle) {
            _mahalle = mahalle;
            print("il seçimi tamamlandı: $mahalle");
          },
        ),
      ),
    );
  }
}
