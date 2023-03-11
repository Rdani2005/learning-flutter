import 'dart:ui';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(children: const [
      TableRow(children: [
        _SingleCard(
            text: 'General', color: Colors.blue, icon: Icons.layers_outlined),
        _SingleCard(
          text: 'Shopping',
          color: Colors.deepPurple,
          icon: Icons.shop,
        )
      ]),
      TableRow(children: [
        _SingleCard(
            text: 'Grosery', color: Colors.pink, icon: Icons.layers_outlined),
        _SingleCard(
          text: 'Full',
          color: Colors.orange,
          icon: Icons.mode_night,
        )
      ]),
    ]);
  }
}

class _SingleCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const _SingleCard(
      {required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Icon(
          icon,
          size: 35,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: TextStyle(color: color, fontSize: 18),
      )
    ]));
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
