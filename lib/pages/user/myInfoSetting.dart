import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class myInfoSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF000000)),
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                    child : Text("나의 회원정보")
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("a"),
                                          Text("b")],
                                      ),
                                      Row(
                                        children: [
                                          Text("c"),
                                          Text("d")
                                        ],)],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 371),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF000000)),
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(13, 15, 29, 31),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '간편 로그인 설정',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      height: 1,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(6, 0, 0, 19),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF000000)),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFFFFFFF),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(22, 10, 15, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 3, 12, 3),
                                        child: SizedBox(
                                          width: 278,
                                          child: Text(
                                            '카카오 로그인 연동',
                                            style: GoogleFonts.getFont(
                                              'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              height: 1.2,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFE8E8E8)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        child: Container(
                                          width: 55,
                                          height: 30,
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.5),
                                              color: Color(0xFF0C0507),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x33000000),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 2.5,
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(6, 0, 0, 23),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF000000)),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFFFFFFF),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(23, 11, 14, 9),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 3, 12, 3),
                                        child: SizedBox(
                                          width: 278,
                                          child: Text(
                                            '네이버 로그인 연동',
                                            style: GoogleFonts.getFont(
                                              'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              height: 1.2,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFE8E8E8)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        child: Container(
                                          width: 55,
                                          height: 30,
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE8E8E8),
                                              borderRadius:
                                                  BorderRadius.circular(18.5),
                                            ),
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF000000)),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFFFFFFF),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(22, 11, 15, 9),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 2, 12, 4),
                                        child: SizedBox(
                                          width: 278,
                                          child: Text(
                                            'Google 로그인 연동',
                                            style: GoogleFonts.getFont(
                                              'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              height: 1.2,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFE8E8E8)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        child: Container(
                                          width: 55,
                                          height: 30,
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE8E8E8),
                                              borderRadius:
                                                  BorderRadius.circular(18.5),
                                            ),
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                            ),
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  '내 정보 설정',
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
        ),
      ),
    );
  }
}
