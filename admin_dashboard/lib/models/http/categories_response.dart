import 'dart:convert';

import 'package:admin_dashboard/models/category.dart';

class GetCategoriesResponse {
  final int total;
  final List<Categoria> categorias;

  GetCategoriesResponse({
    required this.total,
    required this.categorias,
  });

  factory GetCategoriesResponse.fromRawJson(String str) =>
      GetCategoriesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      GetCategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
      };
}
