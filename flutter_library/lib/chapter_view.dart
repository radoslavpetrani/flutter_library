import 'package:flutter/material.dart';
import 'package:flutter_library/Objects/sections.dart';

class ChapterView extends StatelessWidget {
  const ChapterView({super.key, required this.title, required this.sections});
  final String title;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildSectionsPageView(),
    );
  }

  Widget _buildSectionsPageView() {
    return PageView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Center(
              child: Text(sections.elementAt(index).content),
            ),
          );
        });
  }
}
