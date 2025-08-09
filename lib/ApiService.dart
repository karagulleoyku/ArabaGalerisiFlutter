import 'dart:convert';
import 'package:http/http.dart' as http;
import 'araba.dart';


class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080/api";

  static Future<List<Araba>> arabalarGetir() async {
    final response = await http.get(Uri.parse("$baseUrl/arabalar")).timeout(
        const Duration(seconds: 60));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Araba.fromJson(e)).toList();
    } else {
      throw Exception("Veri alınamadı");
    }
  }

  static Future<List<Araba>> markayaGoreAra(String marka) async {
    final response = await http.get(Uri.parse("$baseUrl/arabalar/ara?marka=$marka"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Araba.fromJson(e)).toList();
    } else {
      throw Exception("Veri alınamadı");
    }
  }

  static Future<List<Araba>> fiyataGoreGetir(double maxFiyat) async {
    final response = await http.get(
        Uri.parse("$baseUrl/arabalar/alt-fiyat?maxFiyat=$maxFiyat"));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Araba.fromJson(e)).toList();
    } else {
      throw Exception("Veri alınamadı");
    }
  }
}

