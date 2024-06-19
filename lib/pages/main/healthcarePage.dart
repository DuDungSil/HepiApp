import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/user.dart';
import '../user/loginPage.dart';

class healthcarePage extends StatefulWidget {
  @override
  State<healthcarePage> createState() => _healthcarePageState();
}

class _healthcarePageState extends State<healthcarePage> {
  var loginUser = null;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // didChangeDependencies에서 context를 안전하게 사용
    loginUser = context.watch<user>();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x1A000000),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          (loginUser.id != null)
                              ? Container(
                                  child: Text(
                                    loginUser.name,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              loginPage()),
                                    );
                                  },
                                  child: Container(
                                    child: Text(
                                      "로그인을 해주세요 >",
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      (loginUser.id != null)
                          ? Container(
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // 영양 정보 설정
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text(
                                        '영양 정보 입력',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 10,
                                    child: SizedBox(
                                      width: 5,
                                      height: 10,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_9_x2.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                Container(
                  // 영양 정보
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            height: 1.3,
                            color: Color(0xFF000000),
                          ),
                          children: [
                            TextSpan(
                              text: '이윤구',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                height: 1.3,
                              ),
                            ),
                            TextSpan(
                              text: '님의 영양제 점수는 ',
                            ),
                            TextSpan(
                              text: '100',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                height: 1.3,
                              ),
                            ),
                            TextSpan(
                              text: ' 점입니다.',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2, 20, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Container(
                                child: Text(
                                  '100점',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    height: 1.3,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(
                              '비타민',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(13, 0, 13, 66),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        '나에게 맞는 영양성분 알아보기',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2.2, 0, 0, 70),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '설문하기',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 1.3,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 3, 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              '나를 위한 맞춤 영양제 상담받기',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 54, 1.8, 54),
                          child: Text(
                            '상담받기',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              height: 1.3,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 3, 49),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              '건강검진결과 불러오기',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 54, 1.8, 54),
                          child: Text(
                            '연동하기',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              height: 1.3,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1F000000),
                        offset: Offset(0, 0),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(29, 11, 29, 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: SvgPicture.network(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: SvgPicture.network(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: SvgPicture.network(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: SvgPicture.network(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: SvgPicture.network(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // 테두리 색상
                  width: 0.3, // 테두리 두께
                ),
              ),
            ),
            child: Text(
              '건강 관리',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 1.3,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
