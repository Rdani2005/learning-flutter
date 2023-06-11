import 'package:fluro/fluro.dart';

import 'package:fl_landing/ui/pages/pages.dart';
import 'package:fl_landing/router/router_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    // Routes
    router.define(HomePage.routeName, handler: homeHandler);
    // 404
    router.notFoundHandler = homeHandler;
  }
}
