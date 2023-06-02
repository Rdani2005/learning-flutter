import 'package:flutter/material.dart';
import 'package:fl_qrscanner/widgets/widgets.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScansList(
      icon: Icons.home_outlined,
    );
  }
}
