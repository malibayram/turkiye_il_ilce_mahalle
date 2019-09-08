library turkiye_il_ilce_mahalle;

import 'package:flutter/material.dart';
import 'pages/aramasayfasi.dart';

class Il extends StatefulWidget {
  final Function fonksiyon;
  final Widget child;
  final Color barRengi;
  final Color yaziRengi;

  const Il({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _IlState createState() => _IlState();
}

class _IlState extends State<Il> {
  Map _il = {"bilesenAdi": "İl Seçimi Yapın"};

  ilSecimiYap(Map secim) {
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
  final Function fonksiyon;
  final Widget child;
  final String ilKodu;
  final bool ilVarMi;
  final Color barRengi;
  final Color yaziRengi;

  const Ilce({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    @required this.ilKodu,
    @required this.ilVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _IlceState createState() => _IlceState();
}

class _IlceState extends State<Ilce> {
  Map _ilce = {"bilesenAdi": "İlce Seçimi Yapın"};

  ilceSecimiYap(Map secim) {
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
  final Function fonksiyon;
  final Widget child;
  final String ilceKodu;
  final bool ilceVarMi;
  final Color barRengi;
  final Color yaziRengi;

  const Mahalle({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    @required this.ilceKodu,
    @required this.ilceVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _MahalleState createState() => _MahalleState();
}

class _MahalleState extends State<Mahalle> {
  Map _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};

  mahalleSecimiYap(Map secim) {
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

class Yol extends StatefulWidget {
  final Function fonksiyon;
  final Widget child;
  final String mahalleKodu;
  final bool mahalleVarMi;
  final Color barRengi;
  final Color yaziRengi;

  const Yol({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    @required this.mahalleKodu,
    @required this.mahalleVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _YolState createState() => _YolState();
}

class _YolState extends State<Yol> {
  Map _yol = {"bilesenAdi": "Yol Seçimi Yapın"};

  yolSecimiYap(Map secim) {
    _yol = secim;
    widget.fonksiyon(_yol);
    print("Seçilen Yol: ${_yol['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.mahalleVarMi) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdresAramaSyf({
                  "liste": "yol",
                  "kod": widget.mahalleKodu,
                  "fonksiyon": yolSecimiYap,
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

class Bina extends StatefulWidget {
  final Function fonksiyon;
  final Widget child;
  final String yolKodu;
  final bool yolVarMi;
  final String mahalleKodu;
  final bool mahalleVarMi;
  final Color barRengi;
  final Color yaziRengi;

  const Bina({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    @required this.yolKodu,
    @required this.yolVarMi,
    this.mahalleKodu,
    this.mahalleVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _BinaState createState() => _BinaState();
}

class _BinaState extends State<Bina> {
  Map _bina = {"bilesenAdi": "Bina Seçimi Yapın"};

  binaSecimiYap(Map secim) {
    _bina = secim;
    widget.fonksiyon(_bina);
    print("Seçilen Bina: ${_bina['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.yolVarMi) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdresAramaSyf({
                  "liste": "bina",
                  "kod": widget.mahalleKodu,
                  "kod2": widget.yolKodu,
                  "fonksiyon": binaSecimiYap,
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

class Daire extends StatefulWidget {
  final Function fonksiyon;
  final Widget child;
  final String binaKodu;
  final bool binaVarMi;
  final String mahalleKodu;
  final bool mahalleVarMi;
  final Color barRengi;
  final Color yaziRengi;

  const Daire({
    Key key,
    @required this.fonksiyon,
    @required this.child,
    @required this.binaKodu,
    @required this.binaVarMi,
    this.mahalleKodu,
    this.mahalleVarMi,
    this.barRengi,
    this.yaziRengi,
  }) : super(key: key);

  @override
  _DaireState createState() => _DaireState();
}

class _DaireState extends State<Daire> {
  Map _daire = {"bilesenAdi": "Daire Seçimi Yapın"};

  daireSecimiYap(Map secim) {
    _daire = secim;
    widget.fonksiyon(_daire);
    print("Seçilen Daire: ${_daire['bilesenAdi']}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.binaVarMi) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdresAramaSyf({
                  "liste": "daire",
                  "kod": widget.mahalleKodu,
                  "kod2": widget.binaKodu,
                  "fonksiyon": daireSecimiYap,
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
