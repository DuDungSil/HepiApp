import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/productCard/WideOptionProductCard.dart';


class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              // 전체 레이아웃
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 140, child: Container() // 미완성 ( 이벤트 그림 )
                    ),
                Container(
                  // 필터
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
                  child: Container(
                    width: 340,
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
                        Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 14, 0),
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/category.svg',
                            )),
                        Expanded(
                          child: Text('30개의 결과',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.1,
                                letterSpacing: -0.45,
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(14, 0, 8, 0),
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/candle.svg',
                            )),
                      ],
                    ),
                  ),
                ),
                // Consumer<products>(builder: (consumer, products, child) {
                //   if (products.eventProductList.isEmpty) {
                //     return Container(
                //         alignment: Alignment.center,
                //         height: 250,
                //         margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                //         child: CircularProgressIndicator());
                //   } else {
                //     return
                      Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: 350,
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: 5 , // 카드의 개수를 설정합니다.
                        itemBuilder: (context, index) {
                          return Row(children : [WideOptionProductCard()]);
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 10,),
                      ),
                    )
                  //}
                //}
                //),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: '진행 중인 이벤트',
          )
        ),
      ],
    );
    ;
  }
}
