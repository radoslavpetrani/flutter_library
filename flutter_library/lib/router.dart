import 'package:flutter/material.dart';
import 'package:flutter_library/book_view.dart';
import 'package:flutter_library/chapter_view.dart';
import 'package:flutter_library/content_view.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    List list = routeSettings.arguments as List<Object>;
    switch (routeSettings.name) {
      case '/book':
        return platformPageRoute(
            builder: (_) => BookView(
                  title: list[0],
                  length: list[1],
                  contents: list[2],
                  api: list[3],
                ));
      case '/book/content':
        return platformPageRoute(
            builder: (_) => ContentView(
                  subtitle: list[0],
                  bookDescription: list[1],
                  chapters: list[2],
                ));
      case '/book/content/chapter':
        return platformPageRoute(
            builder: (_) => ChapterView(title: list[0], sections: list[1]));
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
