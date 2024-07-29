import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  // 생성자에서 콜백 함수를 받음
  CustomBackButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        child: SvgPicture.asset(
          'assets/vectors/arrow_back.svg',
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}