import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimadedScreen extends StatefulWidget {
  const AnimadedScreen({Key? key}) : super(key: key);

  @override
  State<AnimadedScreen> createState() => _AnimadedScreenState();
}

class _AnimadedScreenState extends State<AnimadedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadious = BorderRadius.circular(10);

  void changeShape() {
    _width = Random().nextInt(300).toDouble() + 70;
    _height = Random().nextInt(300).toDouble() + 70;
    _borderRadious =
        BorderRadius.circular(Random().nextInt(100).toDouble() + 10);
    _color = Color.fromARGB(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          decoration:
              BoxDecoration(color: _color, borderRadius: _borderRadious),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.play_circle_fill_outlined,
            size: 35,
          ),
          onPressed: () => changeShape()),
    );
  }
}
