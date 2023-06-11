import 'package:flutter/material.dart';

class NotificationsIndicador extends StatelessWidget {
  const NotificationsIndicador({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications_outlined,
          color: Colors.grey,
        ),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: buildDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      );
}
