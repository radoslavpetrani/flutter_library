import 'package:flutter/material.dart';

import 'models/chapter.dart';
import 'chapter_view.dart';

class ContentView extends StatelessWidget {
  const ContentView(
      {super.key,
      required this.subtitle,
      required this.bookDescription,
      required this.chapters});
  final String subtitle;
  final String bookDescription;
  final List<Chapter> chapters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(subtitle),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: _buildChaptersList(),
            )
          ],
        ));
  }

  Widget _buildChaptersList() {
    return ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chapters.elementAt(index).title),
            onTap: () {
              Navigator.of(context).pushNamed('/book/content/chapter',
                  arguments: [
                    chapters.elementAt(index).title,
                    chapters.elementAt(index).sections
                  ]);

              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChapterView(
                            title: chapters.elementAt(index).title,
                            sections: chapters.elementAt(index).sections,
                          )));*/
            },
          );
        });
  }
}
