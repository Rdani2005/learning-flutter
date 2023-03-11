import 'package:cofee/models/cofee_type.dart';
import 'package:flutter/material.dart' show Image;

class Cofee {
  final String name;
  final String description;
  final double price;
  final CofeeType type;
  final Image image;
  Cofee(
      {required this.name,
      required this.description,
      required this.price,
      required this.type,
      required this.image});
}
