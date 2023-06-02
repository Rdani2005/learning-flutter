import 'package:flutter/material.dart';
import 'package:fl_qrscanner/widgets/widgets.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScansList(
      icon: Icons.map,
    );
  }
}
