import 'package:flutter_library/Objects/content.dart';

class Book {
  final String title;
  final String author;
  final String isbn;
  final int length;
  final List<Content> contents;

  Book(
      {required this.title,
      required this.author,
      required this.isbn,
      required this.length,
      required this.contents});

  static Book fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json['contents'];
    List<Content> contents = [];
    for (dynamic element in temp) {
      contents.add(Content.fromJson(element));
    }
    return Book(
        title: json['title'],
        author: json['author'],
        isbn: json['ISBN'],
        length: json['length'],
        contents: contents);
  }
}
