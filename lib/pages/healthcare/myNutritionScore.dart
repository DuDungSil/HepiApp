import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 600,)
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
