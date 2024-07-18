import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final Widget? child;
  final Widget? leading; // 왼쪽 버튼을 위한 위젯
  final List<Widget>? trailing; // 오른쪽 버튼들을 위한 위젯 리스트

  const CustomAppbar({super.key, required this.title, this.child, this.leading, this.trailing});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        alignment: Alignment.center,
        margin: Constants.SCREEN_HORIZONTAL_MARGIN,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        height: (widget.child == null) ? Constants.APPBAR_TITLE_HEIGHT : Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: widget.leading ?? SizedBox(width: 28), // 왼쪽 버튼 (leading)
                ),
                Align(
                  alignment: Alignment.center,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: widget.trailing != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.trailing!,
                        )
                      : SizedBox(width: 28), // 오른쪽 버튼들 (trailing)
                ),
              ],
            ),
            if (widget.child != null) widget.child!,
          ],
        ),
      ),
    );
  }
}
