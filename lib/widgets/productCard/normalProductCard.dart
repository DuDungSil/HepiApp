import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

Widget NormalProductCard(var product) {
  return Container(
    width: 120,
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Container(
            height: 100,
            child: Container(
              child: CachedNetworkImage(
                imageUrl: product.main_image,
                placeholder: (context, url) => Center(
                  child: Constants.defalutProgressIndicatorWidget,
                ),
                errorWidget: (context, url, error) => Constants.defalutErrorWidget,
                fit: BoxFit.contain,
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
        Text(
            '₩ 122,664',
            style: Constants.getLineTxt(12, Colors.black38)
        ),
        Text(
            '₩ ' + product.price.toString(),
            style: Constants.getPretendardTxt(14, Colors.red)
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/vectors/star_fill.svg',
                width: 11,
                height: 11,
              ),
              SvgPicture.asset(
                'assets/vectors/star_fill.svg',
                width: 11,
                height: 11,
              ),
              SvgPicture.asset(
                'assets/vectors/star_half.svg',
                width: 11,
                height: 11,
              ),
              SvgPicture.asset(
                'assets/vectors/star_empty.svg',
                width: 11,
                height: 11,
              ),
              SvgPicture.asset(
                'assets/vectors/star_empty.svg',
                width: 11,
                height: 11,
              ),
              Text(
                '   '+'(673)',
                style: Constants.getRobotoTxt(12, Colors.black45)
              ),
            ],
          ),
        ),
      ],
    ),
  );
}