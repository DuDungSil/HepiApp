import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

class ShowMoreProducts extends StatelessWidget {
  const ShowMoreProducts({super.key});

  // 타이틀
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Container(
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            child: Column(),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: '할인 중인 품목',
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
