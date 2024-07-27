import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/productCard/onSaleBox.dart';
import 'package:flutter_app/widgets/productCard/qrAvailableBox.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class WideOptionProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(8),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0xFFD6D6D6),
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QRAvailableBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    OnSaleBox()
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Optimum Nutrition, 더블 리치 초콜릿 Whey, 2.27kg(5lb)',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Constants.getPretendardTxt(15, Colors.black),
                ),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('₩ 110,397', style: Constants.getPretendardTxt(15, Colors.red)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('₩ 122,664', style: Constants.getLineTxt(12, Colors.black38)),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
