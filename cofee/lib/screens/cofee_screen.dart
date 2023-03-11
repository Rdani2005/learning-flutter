import 'package:flutter/material.dart';

class CofeeScreen extends StatelessWidget {
  const CofeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff0c1015),
                  Color(0xff0c1015),
                ])),
          )
        ],
      ),
    );
  }
}
