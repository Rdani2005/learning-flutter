import 'package:flutter/material.dart';
import 'package:user_preferences/shared/shared.dart';
import 'package:user_preferences/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('is Dark Mode: ${Preferences.isDarkMode}'),
            const Divider(),
            Text("Gender: ${Preferences.gender == 1 ? "Male" : "Female"}"),
            const Divider(),
            Text("Username: ${Preferences.name}"),
            const Divider()
          ],
        ));
  }
}
