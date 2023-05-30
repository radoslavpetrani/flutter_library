import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_library/models/content.dart';

import 'models/book.dart';

class Api {
  String get _baseUrl => "https://davinci.fmph.uniba.sk/~petrani1/knihy.json";

  Api();

  Future<List<dynamic>?> getBooks() async {
    try {
      final json = await _get();
      List<dynamic> items = json["items"];
      return items;
    } catch (e) {
      print("caught exception $e");
    }
    return null;
  }

  Future<dynamic> _get() async {
    final uri = Uri.parse(_baseUrl);
    final response = await http.get(uri);
    final jsonResp = response.body;
    try {
      return jsonDecode(jsonResp);
    } on Exception {
      return null;
    }
  }
}
