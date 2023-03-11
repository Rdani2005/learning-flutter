import 'package:cofee/screens/cofee_screen.dart';
import 'package:cofee/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'cofee': (_) => CofeeScreen()},
    );
  }
}
