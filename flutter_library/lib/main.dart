import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_library/book_view.dart';

import 'Objects/book.dart';

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
      home: MyHomePage(title: 'Book selection'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  List items = [];
  final List<Book> books = [];
  final String title;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await jsonDecode(response);
    items = data["items"];

    for (var element in items) {
      books.add(Book.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(),
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
                    child: _buildBookList(),
                  )
                ],
              ));
        });
  }

  Widget _buildBookList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Center(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(books.elementAt(index).title),
              subtitle: Text(books.elementAt(index).author),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookView(
                              title: books.elementAt(index).title,
                              length: books.elementAt(index).length,
                              isbn: books.elementAt(index).isbn,
                              contents: books.elementAt(index).contents,
                            )));
              },
            ),
          );
        });
  }
}
