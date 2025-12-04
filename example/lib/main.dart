import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/turkiye_il_ilce_mahalle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Türkiye Adres Seçimi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Türkiye Adres Seçimi Örnek'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> _il = {"bilesenAdi": "İl Seçimi Yapın"};
  Map<String, dynamic> _ilce = {"bilesenAdi": "İlçe Seçimi Yapın"};
  Map<String, dynamic> _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Lütfen adres bilgilerinizi seçiniz:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("İl"),
            Il(
              fonksiyon: (Map<String, dynamic> gelenDeger) {
                setState(() {
                  _il = gelenDeger;
                  _ilce = {"bilesenAdi": "İlçe Seçimi Yapın"};
                  _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};
                });
              },
              barRengi: Colors.deepPurple,
              yaziRengi: Colors.white,
              child: _buildSelectionCard(_il['bilesenAdi']),
            ),
            const SizedBox(height: 16),
            if (_il['bilesenAdi'] != "İl Seçimi Yapın") ...[
              _buildSectionTitle("İlçe"),
              Ilce(
                ilVarMi: _il['bilesenAdi'] != "İl Seçimi Yapın",
                ilKodu: _il['kimlikNo']?.toString() ?? "",
                fonksiyon: (Map<String, dynamic> gelenDeger) {
                  setState(() {
                    _ilce = gelenDeger;
                    _mahalle = {"bilesenAdi": "Mahalle Seçimi Yapın"};
                  });
                },
                child: _buildSelectionCard(_ilce['bilesenAdi']),
              ),
              const SizedBox(height: 16),
            ],
            if (_ilce['bilesenAdi'] != "İlçe Seçimi Yapın") ...[
              _buildSectionTitle("Mahalle"),
              Mahalle(
                ilceVarMi: _ilce['bilesenAdi'] != "İlçe Seçimi Yapın",
                ilceKodu: _ilce['kimlikNo']?.toString() ?? "",
                fonksiyon: (Map<String, dynamic> gelenDeger) {
                  setState(() {
                    _mahalle = gelenDeger;
                  });
                },
                child: _buildSelectionCard(_mahalle['bilesenAdi']),
              ),
              const SizedBox(height: 30),
            ],
            if (_mahalle['bilesenAdi'] != "Mahalle Seçimi Yapın")
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Seçilen Adres:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${_mahalle['bilesenAdi']} Mah. / ${_ilce['bilesenAdi']} / ${_il['bilesenAdi']}",
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }

  Widget _buildSelectionCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), const Icon(Icons.arrow_drop_down)],
      ),
    );
  }
}
