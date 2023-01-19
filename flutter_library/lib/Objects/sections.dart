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

  static Section fromJson(json) => Section(
        title: json['title'],
        subtitle: json['subtitle'],
        content: json['content'],
        notes: json['notes'],
      );
}
