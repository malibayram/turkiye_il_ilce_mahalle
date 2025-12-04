import 'dart:convert';

import 'package:http/http.dart' as http;

class TurkiyeLocationService {
  static const String _baseUrl = 'https://api.turkiyeapi.dev/v1';

  Future<List<Map<String, dynamic>>> getProvinces() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/provinces'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'OK') {
          final List data = jsonResponse['data'];
          return data.cast<Map<String, dynamic>>();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getDistricts(int provinceId) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/provinces/$provinceId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'OK') {
          final Map<String, dynamic> data = jsonResponse['data'];
          final List districts = data['districts'];
          return districts.cast<Map<String, dynamic>>();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getNeighborhoods(int districtId) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/districts/$districtId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'OK') {
          final Map<String, dynamic> data = jsonResponse['data'];
          if (data.containsKey('neighborhoods')) {
            final List neighborhoods = data['neighborhoods'];
            return neighborhoods.cast<Map<String, dynamic>>();
          }
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
