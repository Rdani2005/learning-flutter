import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.color = Colors.indigo,
    this.isFilled = false,
  });

  final String text;
  final Color color;
  final IconData icon;
  final Function onPressed;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color.withOpacity(0.5)),
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.3)),
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
