import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.photo_album_outlined),
          title: Text('Soy un titulo!'),
          subtitle: Text(
              'Fugiat deserunt aliqua esse sit amet exercitation qui commodo. Qui amet exercitation Lorem laborum est minim incididunt. Occaecat eiusmod irure ut qui. Veniam do tempor occaecat anim culpa officia sunt est do. Sunt consectetur fugiat non sint duis. Do excepteur non amet deserunt consequat deserunt ipsum irure exercitation ut sunt.'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          ),
        )
      ]),
    );
  }
}

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.name,
  }) : super(key: key);

  final String imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 50,
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage('assets/jar-loading.gif'),
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
        ),
        if (name != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(name ?? 'No title'))
      ]),
    );
  }
}
