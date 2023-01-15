import 'package:flutter/material.dart';
import 'package:flutter_library/Page.dart';

class Book extends StatelessWidget {
  const Book({super.key, required this.title});
  final String title;
  final int pages = 4;
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
              child: _buildPageList(),
            )
          ],
        ));
  }

  Widget _buildPageList() {
    return ListView.builder(
        itemCount: pages,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("page $index"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookPage(
                            pageNum: index,
                            pages: pages,
                          )));
            },
          );
        });
  }
}
