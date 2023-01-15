import 'package:flutter/material.dart';
import 'package:flutter_library/book.dart';

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
      home: MyHomePage(title: 'Contents'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final List<String> bookNames = ["Book 1", "Book 2", "Book 3"];
  final List<String> authors = ["Author", "Author", "Author"];
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
              child: _buildBookList(),
            )
          ],
        ));
  }

  Widget _buildBookList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: bookNames.length,
        itemBuilder: (context, index) {
          return Center(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(bookNames.elementAt(index)),
              subtitle: Text(authors.elementAt(index)),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Book(
                              title: bookNames.elementAt(index),
                            )));
              },
            ),
          );
        });
  }
}
