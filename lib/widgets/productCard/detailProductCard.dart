import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/productCard/qrAvailableBox.dart';
import 'package:flutter_app/widgets/productCard/onSaleBox.dart';
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
            padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 5,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/example.png'),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalImages, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0), // 이미지 간의 간격 조절
                      child: Container(
                        width: 5,
                        height: 5,
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
                SizedBox(height: 10),
                Text(
                  'California Gold Nutrition, Sport, 분리유청단백질, 무맛, 454g(1lb)',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Constants.getPretendardTxt(14, Colors.black)
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₩ 110,397',
                      style: Constants.getPretendardTxt(18, Colors.red)
                    ),
                    SizedBox(width: 10),
                    Text(
                      '₩ 122,664',
                      style: Constants.getLineTxt(15, Colors.black54)
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QRAvailableBox(),
                    SizedBox(
                      width: 10,
                    ),
                    OnSaleBox()
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}