import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: (size.width > 1000) ? size.height * 0.07 : null,
      color: Colors.black,
      child: const Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'about'),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Terms of Service'),
          LinkText(text: 'Privacy Policy'),
          LinkText(text: 'Ads Info'),
          LinkText(text: 'Blog'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Brand Resources'),
          LinkText(text: 'Advertising'),
          LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
