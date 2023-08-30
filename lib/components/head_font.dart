import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadFont extends StatelessWidget {
  const HeadFont({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9D44C0),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
