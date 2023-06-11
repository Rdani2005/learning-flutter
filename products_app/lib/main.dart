import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthService()), // Servicio de autentificacion
        ChangeNotifierProvider(
            create: (_) => ProductsService()) // Servicio de productos
      ],
      child: _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'check',
      scaffoldMessengerKey: NotificationsService.messengerKey,
      routes: {
        'check': (_) => CheckScreen(),
        'home': (_) => HomeScreen(),
        'login': (_) => LoginScreen(),
        'product': (_) => ProductScreen(),
        'register': (_) => RegisterScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
