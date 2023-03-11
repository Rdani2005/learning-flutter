import 'dart:ui';

import 'package:flutter/material.dart';

class BottomCustomBar extends StatelessWidget {
  const BottomCustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 33, 33),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.home_filled,
                  color: Color(0xffd37842),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              ],
            )),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  _CardBackground({required this.child});
  final Widget child;

  final BoxDecoration boxDecoration = BoxDecoration(
      color: const Color.fromRGBO(62, 66, 107, 0.7),
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: boxDecoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
