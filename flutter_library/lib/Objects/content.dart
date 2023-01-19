import 'package:flutter_library/Objects/chapter.dart';

class Content {
  final String subtitle;
  final String bookDescription;
  final List<Chapter> chapters;

  Content({
    required this.subtitle,
    required this.bookDescription,
    required this.chapters,
  });

  static Content fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json['chapters'];
    List<Chapter> chapters = [];
    for (dynamic element in temp) {
      chapters.add(Chapter.fromJson(element));
    }

    return Content(
      subtitle: json['subtitle'],
      bookDescription: json['bookDescription'],
      chapters: chapters,
    );
  }
}
