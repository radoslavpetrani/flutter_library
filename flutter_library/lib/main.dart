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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  final int pages = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text("page" + index.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookPage(
                            pageNum: index,
                          )));
            },
          );
          return Text("page" + index.toString());
        });
  }
}
