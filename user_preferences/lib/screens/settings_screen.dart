import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/shared/shared.dart';
import 'package:user_preferences/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routerName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // int gender = 1;
  // String name = "Dan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings: ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  onChanged: (value) {
                    Preferences.isDarkMode = value;

                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);

                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();

                    setState(() {});
                  },
                  title: const Text('Darkmode'),
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text("Male"),
                  onChanged: (value) {
                    Preferences.gender = 1;
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: const Text("Female"),
                  onChanged: (value) {
                    Preferences.gender = 2;
                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: "Name",
                      helperText: "Username",
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
