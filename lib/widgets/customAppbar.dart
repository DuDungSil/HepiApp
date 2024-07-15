import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final Widget? child;

  const CustomAppbar({super.key, required this.title, this.child});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: Constants.SCREEN_HORIZONTAL_MARGIN,
      padding: EdgeInsets.fromLTRB(5,5,5,10),
      decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
      height: (widget.child == null) ? Constants.APPBAR_TITLE_HEIGHT : Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 수정
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              widget.title,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 1.2,
                letterSpacing: -0.5,
                color: Color(0xFF111111),
              ),
            ),
          ),
          if(widget.child != null) widget.child!
        ],
      ),
    );
  }
}
