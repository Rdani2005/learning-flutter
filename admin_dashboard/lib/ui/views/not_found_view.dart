import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "404 - Page Not Found",
        style: GoogleFonts.montserratAlternates(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
