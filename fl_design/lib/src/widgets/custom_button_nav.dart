import 'package:flutter/material.dart';

class CustomButtonNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline), label: 'Graficas'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle), label: 'User'),
      ],
    );
  }
}
