import 'dart:convert';
import 'package:flutter/material.dart';
import '../datas/il.dart';
import '../datas/ilce.dart';
import '../datas/koy.dart';
import '../datas/mahalle.dart';

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
  Function secim;
  Color barRengi;
  Color yaziRengi;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Map args = widget.gelen;
    aranan = args['liste'];
    kod = args["kod"];
    secim = args['fonksiyon'];

    barRengi = args['bar_rengi'] ?? Colors.blue;
    yaziRengi = args['yazi_rengi'] ?? Colors.white;

    print(kod);
  }

  Future<List> listeOlustur() async {
    List liste = [];
    switch (aranan) {
      case 'ilce':
        liste = json.decode(Ilce.ilce);
        return liste.where((w) => w['il_id'] == kod).toList();
        break;

      case 'koy':
        liste = json.decode(Koy.koy);
        return liste.where((w) => w['ilce_id'] == kod).toList();
        break;

      case 'mahalle':
        liste = json.decode(Mahalle.mahalle);
        return liste.where((w) => w['koy_id'] == kod).toList();
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
      body: FutureBuilder(
        future: listeOlustur(),
        builder: (ctx, a) {
          if (a.hasData) {
            List cevap = a.data;
            return ListView.builder(
              itemCount: cevap.length,
              itemBuilder: (ctx, i) {
                if (cevap[i][aranan]
                        .toString()
                        .toUpperCase()
                        .contains(k.toUpperCase()) ||
                    cevap[i][aranan]
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase())) {
                  return ListTile(
                    selected: int.parse(cevap[i]['id']) == secili,
                    onTap: () {
                      secili = int.parse(cevap[i]['id']);
                      secim(cevap[i]);
                      setState(() {});
                    },
                    title: Text(cevap[i][aranan]),
                    trailing: int.parse(cevap[i]['id']) == secili
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
