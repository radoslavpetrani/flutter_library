import 'package:flutter/material.dart';
import 'package:flutter_library/api.dart';
import 'package:flutter_library/models/content.dart';
import 'package:flutter_library/content_view.dart';
import 'package:go_router/go_router.dart';

class BookView extends StatelessWidget {
  BookView(
      {super.key,
      required this.title,
      required this.length,
      required this.contents,
      required this.api});
  final String title;
  final int length;
  final String contents;
  final Api api;
  final List<Content> contentList = [];

  Future<void> readJsonBook() async {
    final items = await api.getBook(contents) ?? [];
    for (var element in items) {
      contentList.add(Content.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonBook(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
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
        });
  }

  Widget _buildContentList() {
    return ListView.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contentList.elementAt(index).subtitle),
            onTap: () {
              Navigator.of(context).pushNamed('/book/content', arguments: [
                contentList.elementAt(index).subtitle,
                contentList.elementAt(index).bookDescription,
                contentList.elementAt(index).chapters,
              ]);
/*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContentView(
                            subtitle: contentList.elementAt(index).subtitle,
                            bookDescription:
                                contentList.elementAt(index).bookDescription,
                            chapters: contentList.elementAt(index).chapters,
                          )));*/
            },
          );
        });
  }
}
