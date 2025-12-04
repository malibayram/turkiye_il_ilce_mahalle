import 'package:flutter/material.dart';
import 'package:turkiye_il_ilce_mahalle/service/turkiye_location_service.dart';

class AdresAramaSyf extends StatefulWidget {
  final String aranan;
  final String kod;
  final Function(Map<String, dynamic>) secim;
  final Color barRengi;
  final Color yaziRengi;

  const AdresAramaSyf({
    Key? key,
    required this.aranan,
    required this.kod,
    required this.secim,
    this.barRengi = Colors.blue,
    this.yaziRengi = Colors.white,
  }) : super(key: key);

  @override
  _AdresAramaSyfState createState() => _AdresAramaSyfState();
}

class _AdresAramaSyfState extends State<AdresAramaSyf> {
  late String aranan;
  String? kod;
  late Function(Map<String, dynamic>) secim;

  final TurkiyeLocationService _service = TurkiyeLocationService();
  List<Map<String, dynamic>> _dataList = [];
  List<Map<String, dynamic>> _filteredList = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    aranan = widget.aranan;
    kod = widget.kod;
    secim = widget.secim;

    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> result = [];
    try {
      if (aranan == "il") {
        result = await _service.getProvinces();
      } else if (aranan == "ilce" && kod != null) {
        result = await _service.getDistricts(int.parse(kod!));
      } else if (aranan == "mahalle" && kod != null) {
        result = await _service.getNeighborhoods(int.parse(kod!));
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }

    if (mounted) {
      setState(() {
        // Map API response keys to expected keys for backward compatibility
        _dataList = result.map((item) {
          return {
            "kimlikNo": item['id'].toString(),
            "bilesenAdi": item['name'],
          };
        }).toList();
        _filteredList = _dataList;
        _isLoading = false;
      });
    }
  }

  void _filterList(String query) {
    setState(() {
      _filteredList = _dataList
          .where((item) => item['bilesenAdi']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.barRengi,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.yaziRengi,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: widget.yaziRengi),
          cursorColor: widget.yaziRengi,
          decoration: InputDecoration(
            hintText: '${aranan.toUpperCase()} Ara...',
            hintStyle:
                TextStyle(color: widget.yaziRengi.withValues(alpha: 0.7)),
            border: InputBorder.none,
          ),
          onChanged: _filterList,
        ),
        iconTheme: IconThemeData(color: widget.yaziRengi),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (context, index) {
                final item = _filteredList[index];
                return ListTile(
                  title: Text(item['bilesenAdi']),
                  onTap: () {
                    secim(item);
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}
