import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_bases/provider/counter_provider.dart';
import 'package:web_bases/ui/shared/shared.dart';

class CounterProviderView extends StatelessWidget {
  const CounterProviderView({super.key});

  static const routeName = '/provider';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(), child: _PageBody());
  }
}

class _PageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterProvider provider = Provider.of<CounterProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Counter Provider',
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Counter ${provider.counter}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
                text: "Increment",
                onPressed: () {
                  provider.increment();
                }),
            CustomFlatButton(
                text: "Decrement",
                onPressed: () {
                  provider.decrement();
                }),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
