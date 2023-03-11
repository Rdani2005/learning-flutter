import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({super.key});
  final BoxDecoration boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [Color(0xff2E305F), Color(0Xff202333)]));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
    );
  }
}
