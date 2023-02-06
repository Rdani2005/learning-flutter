import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart'
    show CustomCardType1, CustomCardType2;

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageUrl:
                'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg',
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageUrl:
                'https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png',
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageUrl:
                'https://llandscapes-10674.kxcdn.com/wp-content/uploads/2019/07/lighting.jpg',
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageUrl:
                'https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg',
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
