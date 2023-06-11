import 'package:flutter/material.dart';
import 'package:web_bases/ui/shared/shared.dart';

class CounterView extends StatefulWidget {
  const CounterView({
    super.key,
    required this.counter,
  });

  final String counter;

  static const routeName = '/stateful';

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    if (int.tryParse(widget.counter) != null) {
      counter = int.parse(widget.counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Counter Statefull',
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Counter $counter',
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
                  counter++;
                  setState(() {});
                }),
            CustomFlatButton(
                text: "Decrement",
                onPressed: () {
                  counter--;
                  setState(() {});
                }),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
