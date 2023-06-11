import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });

  final String text;
  final IconData icon;
  final Function onPressed;
  final bool isActive;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHover
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: widget.isActive ? null : () => widget.onPressed(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: MouseRegion(
                  onEnter: (_) => setState(() => isHover = true),
                  onExit: (_) => setState(() => isHover = false),
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.text,
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: Colors.white.withOpacity(0.8)),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
