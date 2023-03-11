import 'dart:ui';

import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _MenuButton(),
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg'),
        ),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 33, 33, 33),
                  Color.fromARGB(28, 33, 33, 33),
                ]),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
