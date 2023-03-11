import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  ScrollScreen({Key? key}) : super(key: key);

  final BoxDecoration boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
          colors: [Color(0xff5EE8c5), Color(0xff30BAD6)]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [_PageOne(), PageTwo()]),
      ),
    );
  }
}

class _PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // _Background
        _Background(),
        _MainContent()
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '11',
              style: textStyle,
            ),
            const Text(
              'Wednesday',
              style: textStyle,
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff30BAD6),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: const Image(
          image: AssetImage('assets/scroll.png'),
          width: double.infinity,
        ));
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xff0098FA), shape: StadiumBorder()),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Bienvenido!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
