import 'package:flutter/cupertino.dart';
import 'package:flutter_app/function/moneyFormat.dart';
import 'package:google_fonts/google_fonts.dart';

class priceText extends StatelessWidget {
  var price;
  var eventCode;
  var discount;

  priceText(price, eventCode, discount)
  {
    switch(eventCode) {
      case 0:
        this.price = price;
        this.discount = "";
      case 1:
        this.price = (100-discount)*price/100.toInt();
        this.discount = " (${discount}% off)";
      case 2:
        this.price = price-discount;
        this.discount = " (${money.format(discount)} off)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: money.format(price),
        style: GoogleFonts.getFont(
          'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 1.5,
          color: Color(0xFF000000),
        ),
        children: [
          TextSpan(
            text: discount,
            style: GoogleFonts.getFont(
              'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.3,
              color: Color(0xFFFF0000),
            ),
          ),
        ],
      ),
    );
  }
}