import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget NormalProductCard(var product) {
  return Container(
    height: 120,
    width: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFD6D6D6),
          offset: Offset(6, 6),
          blurRadius: 4,
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  product.main_image,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
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
            margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: Text(
                      '₩ ' + product.price.toString(),
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
                      decorationThickness: 2.0, // 선의 두께를 설정
                      height: 1.2,
                      letterSpacing: -0.3,
                      color: Color(0xFF767676),
                      decorationColor: Color(0xFF767676),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      height : 20,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          // 평점 들어가야햠 ( 별 )
                          Container()
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '(673)',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.2,
                      letterSpacing: -0.3,
                      color: Color(0xFF9EA3B2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}