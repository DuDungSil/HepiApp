import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EclipseText extends StatelessWidget {
  final String text;

  EclipseText({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9EA3B2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: Constants.getPretendardTxt(13, Colors.black)
      ),
    );
  }
}
