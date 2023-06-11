import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  List<String> _pages = ['home', 'about', 'contact', 'location', 'pricing'];

  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();
      if (_currentIndex != pageIndex) {
        html.window.history.pushState(null, 'title', '#/${_pages[pageIndex]}');
        html.document.title = _pages[pageIndex];
        _currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) {
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    final routeName = _pages[index];
    html.window.history.pushState(null, 'title', '#/$routeName');
    html.document.title = routeName;
    _currentIndex = index;
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
