import 'package:flutter/material.dart';
import 'package:web_bases/locator.dart';
import 'package:web_bases/services/navigator_service.dart';
import 'package:web_bases/ui/shared/custom_flat_button.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) =>
          constraints.maxWidth > 520 ? _TabletDesktopMenu() : _MobileMenu(),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            text: 'Statefull Counter',
            onPressed: () {
              // Navigator.pushNamed(context, '/stateful');
              // navigatorService.navigateTo('/stateful');
              locator<NavigatorService>().navigateTo('/stateful');
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Provider Counter',
            onPressed: () {
              // Navigator.pushNamed(context, '/provider');
              locator<NavigatorService>().navigateTo('/provider');
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: '404 Page',
            onPressed: () {
              // Navigator.pushNamed(context, '/404');
              locator<NavigatorService>().navigateTo('/abc123');
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Statefull Counter',
            onPressed: () {
              // Navigator.pushNamed(context, '/stateful');
              // navigatorService.navigateTo('/stateful');
              locator<NavigatorService>().navigateTo('/stateful');
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Provider Counter',
            onPressed: () {
              // Navigator.pushNamed(context, '/provider');
              locator<NavigatorService>().navigateTo('/provider');
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: '404 Page',
            onPressed: () {
              // Navigator.pushNamed(context, '/404');
              locator<NavigatorService>().navigateTo('/abc123');
            },
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
            text: 'Stateful Counter 100',
            onPressed: () {
              // Navigator.pushNamed(context, '/provider');
              locator<NavigatorService>().navigateTo('/stateful/100');
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
