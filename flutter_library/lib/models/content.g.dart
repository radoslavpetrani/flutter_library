// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      subtitle: json['subtitle'] as String,
      bookDescription: json['bookDescription'] as String,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'subtitle': instance.subtitle,
      'bookDescription': instance.bookDescription,
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
    };
