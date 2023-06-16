import 'package:flutter/material.dart';
import 'package:flutter_library/dao.dart';
import 'package:flutter_library/router.dart';
import 'models/book.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
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

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final Dao dao = Dao();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Book> books = [];

  Future<void> readJson() async {
    await widget.dao.getBooks(books);
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
              title: Text(widget.title),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: _buildBookList(),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _refreshBookList,
              tooltip: 'refresh',
              child: const Icon(Icons.cached),
            ),
          );
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
                Navigator.of(context).pushNamed('/book',
                    arguments: {'book': currentBook, 'dao': widget.dao});
              },
            ),
          );
        });
  }

  void _refreshBookList() {
    setState(() {
      widget.dao.refresh(books);
    });
  }
}
