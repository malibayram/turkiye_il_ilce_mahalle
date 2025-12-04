library turkiye_il_ilce_mahalle;

import 'package:flutter/material.dart';

import 'pages/aramasayfasi.dart';

class Il extends StatefulWidget {
  final Function(Map<String, dynamic>) fonksiyon;
  final Widget child;
  final Color? barRengi;
  final Color? yaziRengi;

  const Il({
    Key? key,
    required this.fonksiyon,
    required this.child,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _IlState createState() => _IlState();
}

class _IlState extends State<Il> {
  Map<String, dynamic> _il = {"bilesenAdi": "İl Seçimi Yapın"};

  void ilSecimiYap(Map<String, dynamic> secim) {
    _il = secim;
    widget.fonksiyon(_il);
    print("Seçilen il: ${_il['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return AdresAramaSyf({
                "liste": "il",
                "kod": "",
                "fonksiyon": ilSecimiYap,
                "bar_rengi": widget.barRengi,
                "yazi_rengi": widget.yaziRengi,
              });
            },
          ),
        );
      },
      child: widget.child,
    );
  }
}

class Ilce extends StatefulWidget {
  final Function(Map<String, dynamic>) fonksiyon;
  final Widget child;
  final String ilKodu;
  final bool ilVarMi;
  final Color? barRengi;
  final Color? yaziRengi;

  const Ilce({
    Key? key,
    required this.fonksiyon,
    required this.child,
    required this.ilKodu,
    required this.ilVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _IlceState createState() => _IlceState();
}

class _IlceState extends State<Ilce> {
  Map<String, dynamic> _ilce = {"bilesenAdi": "İlce Seçimi Yapın"};

  void ilceSecimiYap(Map<String, dynamic> secim) {
    _ilce = secim;
    widget.fonksiyon(_ilce);
    print("Seçilen ilce: ${_ilce['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.ilVarMi) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdresAramaSyf({
                  "liste": "ilce",
                  "kod": widget.ilKodu,
                  "fonksiyon": ilceSecimiYap,
                  "bar_rengi": widget.barRengi,
                  "yazi_rengi": widget.yaziRengi,
                });
              },
            ),
          );
        }
      },
      child: widget.child,
    );
  }
}

class Mahalle extends StatefulWidget {
  final Function(Map<String, dynamic>) fonksiyon;
  final Widget child;
  final String ilceKodu;
  final bool ilceVarMi;
  final Color? barRengi;
  final Color? yaziRengi;

  const Mahalle({
    Key? key,
    required this.fonksiyon,
    required this.child,
    required this.ilceKodu,
    required this.ilceVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _MahalleState createState() => _MahalleState();
}

class _MahalleState extends State<Mahalle> {
  Map<String, dynamic> _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};

  void mahalleSecimiYap(Map<String, dynamic> secim) {
    _mahalle = secim;
    widget.fonksiyon(_mahalle);
    print("Seçilen Mahalle: ${_mahalle['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.ilceVarMi) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdresAramaSyf({
                  "liste": "mahalle",
                  "kod": widget.ilceKodu,
                  "fonksiyon": mahalleSecimiYap,
                  "bar_rengi": widget.barRengi,
                  "yazi_rengi": widget.yaziRengi,
                });
              },
            ),
          );
        }
      },
      child: widget.child,
    );
  }
}
