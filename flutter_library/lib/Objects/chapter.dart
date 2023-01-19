import 'sections.dart';

class Chapter {
  final String title;
  final List<Section> sections;

  Chapter({
    required this.title,
    required this.sections,
  });

  static Chapter fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json['sections'];
    List<Section> sections = [];
    for (dynamic element in temp) {
      sections.add(Section.fromJson(element));
    }
    return Chapter(title: json['title'], sections: sections);
  }
}
