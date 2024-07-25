import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget NormalProductCard(var product) {
  return Container(
    width: 150,
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFD6D6D6),
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey,
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
                  margin: EdgeInsets.only(top: 3),
                  child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Constants.getPretendardTxt(13, Colors.black)
                  ),
                ),
              ],
            )
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  '₩ ' + product.price.toString(),
                  style: Constants.getPretendardTxt(15, Colors.red)
                ),
              ),
              Text(
                '₩ 122,664',
                style: Constants.getLineTxt(13, Colors.black38)
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('⭐'),
              Text('⭐'),
              Text('⭐'),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.saturation,
                ),
                child: Text('⭐'),
              ),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.saturation,
                ),
                child: Text('⭐'),
              ),
              Text(
                '   '+'(673)',
                style: Constants.getRobotoTxt(15, Colors.black45)
              ),
            ],
          ),
        ),
      ],
    ),
  );
}