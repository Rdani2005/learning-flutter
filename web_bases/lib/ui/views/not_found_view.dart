import 'package:flutter/material.dart';
import 'package:web_bases/locator.dart';
import 'package:web_bases/services/navigator_service.dart';
import 'package:web_bases/ui/shared/custom_flat_button.dart';
import 'package:web_bases/ui/views/views.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '404',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Page Not Found",
          style: TextStyle(fontSize: 20),
        ),
        CustomFlatButton(
            text: "Go Home",
            onPressed: () =>
                locator<NavigatorService>().navigateTo(CounterView.routeName)
            // navigatorService.navigateTo(CounterView.routeName),
            )
      ],
    );
  }
}
