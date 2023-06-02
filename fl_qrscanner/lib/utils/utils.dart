import 'package:fl_qrscanner/models/models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(
  BuildContext context,
  ScanModel scan,
) async {
  final Uri url = Uri.parse(scan.value);
  if (scan.type == 'http') {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
    return;
  }
  Navigator.pushNamed(context, 'map');
}
