import 'package:admin_dashboard/ui/cards/cards.dart';
import 'package:flutter/material.dart';

import '../labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Blank View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          const WhiteCard(
            title: 'Sales Statistics',
            child: Text("Hola Mundo!"),
          ),
        ],
      ),
    );
  }
}
