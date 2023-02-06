import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontStyle = TextStyle(fontSize: 30);
    // propiedades
    const mainColor = Color.fromARGB(255, 150, 0, 255);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter By Danny Sequeira'),
        elevation: 2,
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Clicks Counter', style: fontStyle),
              Text('$counter', style: fontStyle),
            ]),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustomFloatingActions(
        mainColor: mainColor,
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;
  final Color mainColor;

  const CustomFloatingActions({
    Key? key,
    required this.mainColor,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const mainColor = Color.fromARGB(255, 150, 0, 255);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () => resetFn(),
          child: const Icon(Icons.one_k_outlined),
        ),
        FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
