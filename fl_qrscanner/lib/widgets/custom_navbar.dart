import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_qrscanner/providers/providers.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: true);

    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: uiProvider.selectedMenuOpt,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: "Address")
        ]);
  }
}
