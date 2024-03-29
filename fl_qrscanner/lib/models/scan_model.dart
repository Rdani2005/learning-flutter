import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  int? id;
  String? type;
  String value;

  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    if (value.contains("http")) {
      type = "http";
    } else {
      type = "geo";
    }
  }

  LatLng getLatLng() {
    final latlng = value.substring(4).split(',');
    final lat = double.parse(latlng[0]);
    final lng = double.parse(latlng[1]);
    return LatLng(lat, lng);
  }

  factory ScanModel.fromRawJson(String str) =>
      ScanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
