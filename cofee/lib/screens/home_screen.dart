import 'package:cofee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          const Positioned(
            top: 15,
            left: 10,
            right: 10,
            child: CustomNavbar(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_TextHeader(), _SearchTxt(), _Filters()],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 15,
            left: 10,
            right: 10,
            child: BottomCustomBar(),
          )
        ],
      ),
    );
  }
}

class _TextHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.w400,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Find the best',
          overflow: TextOverflow.ellipsis,
          style: textStyle,
          textAlign: TextAlign.start,
        ),
        Text(
          'cofee for you',
          overflow: TextOverflow.ellipsis,
          style: textStyle,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _SearchTxt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(20, 255, 255, 255),
            Color.fromARGB(10, 255, 255, 255),
          ]),
          borderRadius: BorderRadius.circular(10)),
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: const [
        Icon(
          Icons.search,
          color: Colors.white,
        )
      ]),
    );
  }
}

class _Filters extends StatelessWidget {
  TextStyle nonFilter = const TextStyle(color: Colors.grey, fontSize: 16);
  TextStyle filtered = const TextStyle(color: Color(0xffd37842), fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Capuccino',
            style: filtered,
          ),
          Text('Espresso', style: nonFilter),
          Text('Latte', style: nonFilter),
          Text('Flat wine', style: nonFilter),
        ],
      ),
    );
  }
}
