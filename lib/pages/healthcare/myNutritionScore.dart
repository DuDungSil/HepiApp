import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';
import '../../widgets/customCircularProgressBar.dart';

class MyNutritionScore extends StatefulWidget {
  const MyNutritionScore({super.key});

  @override
  State<MyNutritionScore> createState() => _MyNutritionScoreState();
}

class _MyNutritionScoreState extends State<MyNutritionScore> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT),
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 1),
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFFF8A00), width: 1))),
                              child: Text('이윤구', style: Constants.getPretendardTxt(18, Color(0xFFFF8A00))),
                            ),
                          ),
                          TextSpan(text: '님의 영양점수', style: Constants.getPretendardTxt(18, Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomCircularProgressBar(
                      value: 82,
                      size: 150,
                      child: Text(
                        '82점',
                        style: Constants.getPretendardTxt(26, Colors.black).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: '나의 영양 점수',
            leading: CustomBackButton(
              onTap: () {
                context.pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
