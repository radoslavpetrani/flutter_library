import 'package:flutter/material.dart';
import 'package:flutter_library/api.dart';
import 'package:flutter_library/book_view.dart';
import 'package:flutter_library/router.dart';
import 'models/book.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final List<Book> books = [];
  final String title;
  final Api api = Api();

  Future<void> readJson() async {
    List<dynamic> items = await api.getBooks() ?? [];
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
          Book currentBook = books.elementAt(index);
          return Center(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(currentBook.title),
              subtitle: Text(currentBook.author),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                Navigator.of(context).pushNamed('/book', arguments: [
                  currentBook.title,
                  currentBook.length,
                  currentBook.contents,
                  api
                ]);
                /*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookView(
                              title: currentBook.title,
                              length: currentBook.length,
                              contents: currentBook.contents,
                              api: api,
                            )));*/
              },
            ),
          );
        });
  }
}
