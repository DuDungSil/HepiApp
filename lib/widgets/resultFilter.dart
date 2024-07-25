import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/constants.dart';
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
      child: Container(
        height: 35,
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
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  'assets/vectors/category.svg',
                ),
              ),
            ),
            Expanded(
              child: Text('30개의 결과', style: Constants.getPretendardTxt(15, Colors.black)),
            ),
            GestureDetector(
              onTap: widget.filtering,
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 20,
                  height: 20,
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
