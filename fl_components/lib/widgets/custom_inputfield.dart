import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
        Icon,
        IconData,
        InputDecoration,
        Key,
        StatelessWidget,
        TextCapitalization,
        TextFormField,
        TextInputType,
        Widget;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;

  final String formProperty;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {},
      validator: (value) {
        if (value == null) return 'Esto es requerido!';
        return value.length < 3 ? 'Se requieren tres letras' : null;
      },
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffix: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
