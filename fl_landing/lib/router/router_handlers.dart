import 'package:fl_landing/providers/page_provider.dart';
import 'package:fl_landing/ui/pages/pages.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  if (page != '/') {
    final PageProvider pageProvider = Provider.of<PageProvider>(
      context!,
      listen: false,
    );
    pageProvider.createScrollController(page);
    return const HomePage();
  }
});
