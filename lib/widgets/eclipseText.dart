import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EclipseText extends StatelessWidget {
  final String text;

  EclipseText({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9EA3B2)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.2,
          letterSpacing: -0.4,
          color: const Color(0xFF191919),
        ),
      ),
    );
  }
}
