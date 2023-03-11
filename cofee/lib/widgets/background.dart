import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  BoxDecoration boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color(0xff0c1015),
        Color(0xff0c1015),
      ]));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: boxDecoration,
    );
  }
}
