import 'package:flutter/material.dart';
import 'package:fl_components/screen/screen.dart';
import 'package:fl_components/models/model.dart';

class AppRoutes {
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        icon: Icons.list,
        name: 'List View',
        screen: const Listview1Screen()),
    MenuOption(
        route: 'alert',
        icon: Icons.add_alert_outlined,
        name: 'Alert',
        screen: const AlertScreen()),
    MenuOption(
        route: 'card',
        icon: Icons.card_giftcard_outlined,
        name: 'Cards',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        name: 'Circle Avatar',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animation',
        icon: Icons.play_circle_outline,
        name: 'Animated Container',
        screen: const AnimadedScreen()),
    MenuOption(
        route: 'inputs',
        icon: Icons.input_rounded,
        name: 'Amazing Inputs',
        screen: const InputScreen()),
    MenuOption(
        route: 'sliders',
        icon: Icons.slideshow_outlined,
        name: 'Sliders',
        screen: const SliderScreen()),
    MenuOption(
        route: 'builders',
        icon: Icons.build,
        name: 'List View Builder & Pull to Refresh',
        screen: const ListViewBuilderScreen()),
  ];

  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
