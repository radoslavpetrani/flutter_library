import 'package:json_annotation/json_annotation.dart';

part 'sections.g.dart';

@JsonSerializable()
class Section {
  final String title;
  final String subtitle;
  final String content;
  final String notes;

  Section({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.notes,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
