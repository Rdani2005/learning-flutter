import 'package:flutter/material.dart';
import 'package:responsive/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({required this.mobileBody, required this.desktopBody});

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < mobileWidth ? mobileBody : desktopBody;
      },
    );
  }
}
