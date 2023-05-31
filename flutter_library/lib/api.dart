import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  String get _baseUrl => "https://davinci.fmph.uniba.sk/~petrani1/";

  Api();

  Future<List<dynamic>?> getBooks() async {
    try {
      final json = await _get("knihy.json");
      List<dynamic> items = json["items"];
      return items;
    } catch (e) {
      print("caught exception $e");
    }
    return null;
  }

  Future<List<dynamic>?> getBook(String url) async {
    try {
      final json = await _get(url);
      List<dynamic> items = json["items"];
      return items;
    } catch (e) {
      print("caught exception $e");
    }
    return null;
  }

  Future<dynamic> _get(String addUrl) async {
    final uri = Uri.parse('$_baseUrl$addUrl');
    final response = await http.get(uri);
    final jsonResp = response.body;
    try {
      return jsonDecode(jsonResp);
    } on Exception {
      return null;
    }
  }
}
