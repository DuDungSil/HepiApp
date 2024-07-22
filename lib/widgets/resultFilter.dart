import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultFilter extends StatefulWidget {
  final Function() setView;
  final Function() filtering;
  const ResultFilter({super.key, required this.setView, required this.filtering});

  @override
  State<ResultFilter> createState() => _ResultFilterState();
}

class _ResultFilterState extends State<ResultFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 필터
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        height: 45,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: widget.setView,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 14, 0),
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  'assets/vectors/category.svg',
                ),
              ),
            ),
            Expanded(
              child: Text('30개의 결과',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    letterSpacing: -0.45,
                  )),
            ),
            GestureDetector(
              onTap: widget.filtering,
              child: Container(
                  margin: EdgeInsets.fromLTRB(14, 0, 8, 0),
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/vectors/candle.svg',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
