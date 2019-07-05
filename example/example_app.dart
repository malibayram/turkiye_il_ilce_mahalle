import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/turkiye_il_ilce_mahalle.dart';

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Türkiye adres seçimi"),
      ),
      body: AdresGetir(),
    );
  }
}
