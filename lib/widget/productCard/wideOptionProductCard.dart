import 'package:flutter/material.dart';
import 'package:flutter_app/widget/productCard/onSaleBox.dart';
import 'package:flutter_app/widget/productCard/qrAvailableBox.dart';
import 'package:google_fonts/google_fonts.dart';

class WideOptionProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 150,
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
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 160,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/example.png'),
                fit: BoxFit.fitWidth,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 18,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      QRAvailableBox(),
                      Container(
                        width: 10,
                      ),
                      OnSaleBox()
                    ],
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Optimum Nutrition, 더블 리치 초콜릿 Whey, 2.27kg(5lb)',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.2,
                          letterSpacing: -0.4,
                          color: Color(0xFF111111),
                        ),
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
                                      fontSize: 15,
                                      height: 1.2,
                                      letterSpacing: -0.3,
                                      color: Color(0xFFDC3644),
                                    ),
                                  ),
                                ),
                                Text(
                                  '₩ 122,664',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2.0,
                                    // 선의 두께를 설정
                                    height: 1.2,
                                    letterSpacing: -0.3,
                                    color: Color(0xFF767676),
                                    decorationColor: Color(0xFF767676),
                                  ),
                                ),
                              ])))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
