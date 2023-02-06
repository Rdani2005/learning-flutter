import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & checks'),
      ),
      body: Column(children: [
        Slider(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue,
            onChanged: _sliderEnable
                ? (value) {
                    _sliderValue = value;
                    setState(() {});
                  }
                : null),
        CheckboxListTile(
            activeColor: AppTheme.primary,
            title:
                Text(_sliderEnable ? 'Desabilitar Slider' : 'Habilitar Slider'),
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value ?? false;
              setState(() {});
            }),
        SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title:
                Text(_sliderEnable ? 'Desabilitar Slider' : 'Habilitar Slider'),
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            }),
        Expanded(
          child: SingleChildScrollView(
            child: Image(
              image: const NetworkImage(
                  'https://cdn.pixabay.com/photo/2023/01/06/02/01/ai-generated-7700259_640.jpg'),
              width: _sliderValue,
            ),
          ),
        ),
      ]),
    );
  }
}
