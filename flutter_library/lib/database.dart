import 'dart:async';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_library/models/chapter.dart';
import 'package:flutter_library/models/content.dart';
import 'package:flutter_library/models/sections.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class DatabaseClass {
  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'Books.db'),
      onCreate: (db, version) async => await db.execute(
          'CREATE TABLE books(title TEXT, author TEXT, isbn TEXT PRIMARY KEY, length  INTEGER, contents TEXT)'),
      version: 1,
    );
  }

  Future<void> insertBook(Book book) async {
    final db = await _getDB();
    await db.insert(
      'books',
      book.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateBook(Book book) async {
    final db = await _getDB();
    await db.update(
      'books',
      book.toJson(),
      where: 'isbn=?',
      whereArgs: [book.isbn],
    );
  }

  Future<void> deleteBook(String isbn) async {
    final db = await _getDB();
    await db.delete(
      'books',
      where: 'isbn = ?',
      whereArgs: [isbn],
    );
  }

  Future<void> deleteAllBooks() async {
    final db = await _getDB();
    await db.delete('books', where: null, whereArgs: null);
  }

  Future<List<Book>> getBooks() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (index) {
      return Book(
          title: maps[index]['title'],
          author: maps[index]['author'],
          isbn: maps[index]['isbn'],
          length: maps[index]['length'],
          contents: maps[index]['contents']);
    });
  }

  Future<bool> isEmpty() async {
    final db = await _getDB();
    int count =
        firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM books')) ?? 0;

    if (count == 0) {
      return true;
    }
    return false;
  }
}
