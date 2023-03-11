import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/landscape.jpg')),
          const Title(),
          const ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: const Text(
              "Nisi in do ipsum et aliqua proident consectetur nostrud voluptate commodo minim ut eiusmod labore. Occaecat esse anim consectetur consequat est sunt in culpa eu anim elit cillum. Sunt eiusmod aliqua irure tempor exercitation veniam sint et. Elit est incididunt duis pariatur nostrud laborum officia anim excepteur. Nisi aliquip aliqua enim magna magna ut laboris. Laborum eu cupidatat aliquip elit eiusmod ut excepteur duis laborum. Excepteur ipsum quis nisi consectetur esse do qui labore nostrud labore in.",
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Kandersteq, Switzerland',
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text("4.5")
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Button(icon: Icons.phone, title: "PHONE"),
          Button(icon: Icons.near_me, title: "ROUTE"),
          Button(icon: Icons.share, title: "SHARE"),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
