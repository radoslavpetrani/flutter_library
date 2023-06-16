import 'package:flutter_library/api.dart';
import 'package:flutter_library/database.dart';
import 'package:flutter_library/models/book.dart';

class Dao {
  final Api api = Api();
  DatabaseClass databaseClass = DatabaseClass();

  Future<void> getBooks(List<Book> books) async {
    if (await databaseClass.isEmpty()) {
      List<dynamic> items = await api.getBooks() ?? [];
      for (var element in items) {
        Book book = Book.fromJson(element);
        books.add(book);
        databaseClass.insertBook(book);
      }
    } else {
      books.addAll(await databaseClass.getBooks());
    }
  }

  Future<List<dynamic>?> getBook(String url) async {
    return api.getBook(url);
  }

  Future<void> refresh(List<Book> books) async {
    books.clear();
    List<dynamic> items = await api.getBooks() ?? [];

    if (items.isEmpty) {
      books.addAll(await databaseClass.getBooks());
    } else {
      databaseClass.deleteAllBooks();
      for (var element in items) {
        Book book = Book.fromJson(element);
        books.add(book);
        databaseClass.insertBook(book);
      }
    }
  }
}
