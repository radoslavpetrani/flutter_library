import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_library/models/content.dart';

import 'models/book.dart';

class Request {
  final String urlPath;
  final Map<String, dynamic>? content;
  Request(this.urlPath, {this.content});

  String toJson() {
    return jsonEncode(content);
  }
}

class Api {
  String get _baseUrl => "https://davinci.fmph.uniba.sk/~petrani1/";

  Api();
  Future<List<Book>?> getBooks() async {
    try {
      //final json = await _post()

      return null;
    } catch (e) {
      print("exception $e");
    }
  }

  Future<dynamic> _get(Request request) async {
    final requestedUrl = '$_baseUrl${request.urlPath}';
    final uri = Uri.parse(requestedUrl);
    final response = await http.get(uri);
    final body = response.body;
    final jsonResp = jsonDecode(body);
    try {
      return jsonDecode(jsonResp);
    } on Exception {
      return null;
    }
  }
}
