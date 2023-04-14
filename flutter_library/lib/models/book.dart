import 'package:flutter_library/models/content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  Book(
      {required this.title,
      required this.author,
      required this.isbn,
      required this.length,
      required this.contents});

  final String title;
  final String author;
  final String isbn;
  final int length;
  final List<Content> contents;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
