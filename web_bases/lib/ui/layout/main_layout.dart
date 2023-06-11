import 'package:flutter/material.dart';
import 'package:web_bases/ui/shared/shared.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const AppMenu(),
            const Spacer(),
            Expanded(child: child),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
