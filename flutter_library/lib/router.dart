import 'package:flutter/material.dart';
import 'package:flutter_library/book_view.dart';
import 'package:flutter_library/chapter_view.dart';
import 'package:flutter_library/content_view.dart';
import 'package:flutter_library/dao.dart';
import 'package:flutter_library/main.dart';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_library/models/chapter.dart';
import 'package:flutter_library/models/content.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/book':
        Map map = routeSettings.arguments as Map<String, Object>;
        Book? book = map['book'] as Book;
        Dao? dao = map['dao'] as Dao;
        return platformPageRoute(
            builder: (_) => BookView(
                  title: book.title,
                  length: book.length,
                  contents: book.contents,
                  isbn: book.isbn,
                  dao: dao,
                ));
      case '/book/content':
        Content content = routeSettings.arguments as Content;
        return platformPageRoute(
            builder: (_) => ContentView(
                  subtitle: content.subtitle,
                  bookDescription: content.bookDescription,
                  chapters: content.chapters,
                ));
      case '/book/content/chapter':
        Chapter chapter = routeSettings.arguments as Chapter;
        return platformPageRoute(
            builder: (_) =>
                ChapterView(title: chapter.title, sections: chapter.sections));
      default:
        return platformPageRoute(builder: (_) => const MyApp());
    }
  }

  static PageRoute platformPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
