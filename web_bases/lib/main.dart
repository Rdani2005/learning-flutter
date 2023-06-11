import 'package:flutter/material.dart';
import 'package:web_bases/locator.dart';
import 'package:web_bases/router/router.dart';
import 'package:web_bases/services/navigator_service.dart';
import 'package:web_bases/ui/layout/main_layout.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoutesApp',
      initialRoute: "/",
      // onGenerateRoute: RouteGenerator.generateRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigatorService>().navigatorKey,
      builder: (_, child) => MainLayout(child: child!),
    );
  }
}
