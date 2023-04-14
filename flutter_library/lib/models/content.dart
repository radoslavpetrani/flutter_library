import 'package:flutter_library/models/chapter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  final String subtitle;
  final String bookDescription;
  final List<Chapter> chapters;

  Content({
    required this.subtitle,
    required this.bookDescription,
    required this.chapters,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
