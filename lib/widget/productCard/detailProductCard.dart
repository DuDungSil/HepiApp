import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/productCard/qrAvailableBox.dart';
import 'package:flutter_app/widget/productCard/onSaleBox.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProductCard extends StatefulWidget {
  @override
  _DetailProductCardState createState() => _DetailProductCardState();
}

class _DetailProductCardState extends State<DetailProductCard> {
  int currentIndex = 0; // 현재 보고 있는 이미지의 인덱스
  int totalImages = 5; // 총 이미지 개수

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: 342,
            height: 390,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 8,
                  offset: Offset(8, 8),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/example.png'),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalImages, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0), // 이미지 간의 간격 조절
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: currentIndex == index
                              ? Color(0xFF111111)
                              : Color(0xFF9EA3B2),
                          shape: OvalBorder(),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.6,
                        child: Text(
                          'California Gold Nutrition, Sport, 분리유청단백질, 무맛, 454g(1lb)',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            // 라인 높이를 조정하여 여러 줄로 표시
                            letterSpacing: -0.35,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                child: Text(
                                  '₩ 110,397',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    height: 1.2,
                                    letterSpacing: -0.3,
                                    color: Color(0xFFDC3644),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '₩ 122,664',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2.0, // 선의 두께를 설정
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                    color: Color(0xFF767676),
                                    decorationColor: Color(0xFF767676),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QRAvailableBox(),
                            SizedBox(
                              width: 10,
                            ),
                            OnSaleBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}