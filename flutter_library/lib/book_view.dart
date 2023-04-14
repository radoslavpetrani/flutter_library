import 'package:flutter/material.dart';
import 'package:flutter_library/models/content.dart';
import 'package:flutter_library/content_view.dart';

class BookView extends StatelessWidget {
  const BookView(
      {super.key,
      required this.title,
      required this.length,
      required this.isbn,
      required this.contents});
  final String title;
  final int length;
  final String isbn;
  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: _buildContentList(),
            )
          ],
        ));
  }

  Widget _buildContentList() {
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contents.elementAt(index).subtitle),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContentView(
                            subtitle: contents.elementAt(index).subtitle,
                            bookDescription:
                                contents.elementAt(index).bookDescription,
                            chapters: contents.elementAt(index).chapters,
                          )));
            },
          );
        });
  }
}
