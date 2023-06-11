import 'dart:convert';

class Categoria {
  final String id;
  final UsuarioCat usuario;
  String nombre;

  Categoria({
    required this.id,
    required this.nombre,
    required this.usuario,
  });

  factory Categoria.fromRawJson(String str) =>
      Categoria.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: UsuarioCat.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toJson(),
      };
}

class UsuarioCat {
  final String id;
  final String nombre;

  UsuarioCat({
    required this.id,
    required this.nombre,
  });

  factory UsuarioCat.fromRawJson(String str) =>
      UsuarioCat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioCat.fromJson(Map<String, dynamic> json) => UsuarioCat(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
      };
}
