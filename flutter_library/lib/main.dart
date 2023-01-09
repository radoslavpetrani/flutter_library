import 'package:flutter/material.dart';
import 'package:flutter_library/Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contents'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
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
