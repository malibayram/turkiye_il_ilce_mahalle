import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/il.dart';
import 'package:turkiye_il_ilce_mahalle/ilce.dart';
import 'package:turkiye_il_ilce_mahalle/koy.dart';
import 'package:turkiye_il_ilce_mahalle/mahalle.dart';

class AdresAramaSyf extends StatefulWidget {
  @override
  _AdresAramaSyfState createState() => _AdresAramaSyfState();
}

class _AdresAramaSyfState extends State<AdresAramaSyf> {
  final String tag = "AdresAramaSyf";

  List liste = [];

  int secili = 0;
  String k = "";
  String aranan = "il";
  String kod = "";
  Function secim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Map args = ModalRoute.of(context).settings.arguments;
    aranan = args['liste'];
    kod = args["kod"];
    secim = args['fonksiyon'];
  }

  Future<List> listeOlustur() async {
    switch (aranan) {
      case 'ilce':
        liste = json.decode(Ilce.ilce);
        return liste;
        break;

      case 'koy':
        liste = json.decode(Koy.koy);
        return liste;
        break;

      case 'mahalle':
        liste = json.decode(Mahalle.mahalle);
        return liste;
        break;

      default:
        liste = json.decode(Il.il);
        return liste;
        break;
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
        backgroundColor: Colors.blue,
        title: TextField(
          onChanged: filtrele,
          decoration: InputDecoration(
            hintText: "Arama Yap",
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Tamam",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: listeOlustur(),
        builder: (ctx, a) {
          if (a.hasData) {
            return ListView.builder(
              itemCount: liste.length,
              itemBuilder: (ctx, i) {
                if (liste[i][aranan]
                        .toString()
                        .toUpperCase()
                        .contains(k.toUpperCase()) ||
                    liste[i][aranan]
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase())) {
                  return ListTile(
                    selected: int.parse(liste[i]['id']) == secili,
                    onTap: () {
                      secili = int.parse(liste[i]['id']);
                      secim(liste[i]);
                      setState(() {});
                    },
                    title: Text(liste[i][aranan]),
                    trailing: int.parse(liste[i]['id']) == secili
                        ? Icon(Icons.check)
                        : null,
                  );
                } else {
                  return SizedBox(height: 0);
                }
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
