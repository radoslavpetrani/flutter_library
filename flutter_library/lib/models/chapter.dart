import 'sections.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable(explicitToJson: true)
class Chapter {
  final String title;
  final List<Section> sections;

  Chapter({
    required this.title,
    required this.sections,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
