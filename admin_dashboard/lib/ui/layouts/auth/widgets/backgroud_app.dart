import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBackgroundImage(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Image(
              image: AssetImage(
                'assets/twitter-white-logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/twitter-bg.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
