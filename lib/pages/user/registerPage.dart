import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class registerPage extends StatefulWidget {
  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(17, 20, 14, 44),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          // 회원가입 전체 레이아웃
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // 회원가입 텍스트 컨테이너
              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 회원가입 텍스트
                    '회원가입',
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      height: 1,
                      color: Color(0xFF323F4B),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // 입력 필드 전체 컨테이너
              margin: EdgeInsets.fromLTRB(25, 35, 25, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // 이름 입력 컨테이너
                      margin: EdgeInsets.fromLTRB(0.4, 0, 0, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '이름',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF7B8794)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(Icons.person_2_outlined)),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '이름을 입력해주세요',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Color(0xFF7B8794),
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
                    Container(
                      // 연락처 입력 컨테이너
                      margin: EdgeInsets.fromLTRB(0.4, 4, 0, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '연락처',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF7B8794)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Container(
                              // 연락처 입력 컨테이너
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            child: Icon(Icons.call_outlined)),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '010-0000-0000',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Color(0xFF7B8794),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      return print('인증하기 클릭');
                                      },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF161616)),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFF161616),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            14.5, 4, 14.5, 4),
                                        child: Text(
                                          '인증하기',
                                          style: GoogleFonts.getFont(
                                            'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            height: 1,
                                            letterSpacing: 1.3,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 이메일 주소 입력 컨테이너
                      margin: EdgeInsets.fromLTRB(0.4, 4, 0, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '이메일 주소',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF7B8794)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Container(
                              // 이름 입력 컨테이너
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(Icons.mail_outline)),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'name@email.com',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Color(0xFF7B8794),
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
                    Container(
                      // 비밀번호 입력 컨테이너
                      margin: EdgeInsets.fromLTRB(0.4, 4, 0, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '비밀번호',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF7B8794)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Container(
                              // 비밀번호 입력 컨테이너
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            child: Icon(Icons.lock_outline)),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '******',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Color(0xFF7B8794),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      return print('비밀번호 보이기 클릭');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: Icon(Icons.visibility_off_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 비밀번호 재확인 컨테이너
                      margin: EdgeInsets.fromLTRB(0.4, 4, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '비밀번호 재확인',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF7B8794)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Container(
                              // 비밀번호 재확인 입력 컨테이너
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            child: Icon(Icons.lock_outline)),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '******',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Color(0xFF7B8794),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      return print('비밀번호 보이기 클릭');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: Icon(Icons.visibility_off_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Text(
                        '영문, 숫자, 특수문자 중 2종류 이상을 조합하여 최소 10자리 이상또는 3종류 이상을 조합하여 최소 8자리 이상의 길이로 구성',
                        style: GoogleFonts.getFont(
                          'Mulish',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF7B8794),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container( // 약관 전체 컨테이너
              margin: EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column( // 약관 레이아웃
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3.4, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '서비스 이용약관',
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12,
                                        height: 1,
                                        letterSpacing: 1.5,
                                        color: Color(0xFF323F4B),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '서비스의 원활한 사용을 보장하기 위해서 헤파이의 서비스 이용약관에 대한 동의가 필요합니다.',
                                  style: GoogleFonts.getFont(
                                    'Mulish',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    height: 1.5,
                                    color: Color(0xFF7B8794),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 13.1, 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 2.7, 13, 3.4),
                                                width: 17.9,
                                                height: 17.9,
                                                child: SizedBox(
                                                    width: 17.9,
                                                    height: 17.9,
                                                    child: Container()),
                                              ),
                                              Text(
                                                '전체 동의 [약관 및 개인정보 수집 등]',
                                                style: GoogleFonts.getFont(
                                                  'Mulish',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  height: 1.5,
                                                  color: Color(0xFF7B8794),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0, 0, 24.4, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 3.7, 8.7, 1.7),
                                                      width: 12.5,
                                                      height: 12.5,
                                                      child: SizedBox(
                                                          width: 12.5,
                                                          height: 12.5,
                                                          child: Container()),
                                                    ),
                                                    Text(
                                                      '[필수] 구매이용약관 동의',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Mulish',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        height: 1.5,
                                                        color:
                                                            Color(0xFF7B8794),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 11, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 3.7, 8.7, 1.7),
                                                      width: 12.5,
                                                      height: 12.5,
                                                      child: SizedBox(
                                                          width: 12.5,
                                                          height: 12.5,
                                                          child: Container()),
                                                    ),
                                                    Text(
                                                      '[필수] 개인정보 수집 이용 동의',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Mulish',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        height: 1.5,
                                                        color:
                                                            Color(0xFF7B8794),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 3.7, 8.7, 1.7),
                                                    width: 12.5,
                                                    height: 12.5,
                                                    child: SizedBox(
                                                        width: 12.5,
                                                        height: 12.5,
                                                        child: Container()),
                                                  ),
                                                  Text(
                                                    '[필수] 헤파이 회원 이용약관 동의',
                                                    style: GoogleFonts.getFont(
                                                      'Mulish',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      height: 1.5,
                                                      color: Color(0xFF7B8794),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 3.8, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 3.7, 8.7, 1.7),
                                                      width: 12.5,
                                                      height: 12.5,
                                                      child: SizedBox(
                                                          width: 12.5,
                                                          height: 12.5,
                                                          child: Container()),
                                                    ),
                                                    Text(
                                                      '[필수] 개인정보 제3자 제공 동의',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Mulish',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        height: 1.5,
                                                        color:
                                                            Color(0xFF7B8794),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 3, 13, 3),
                                            width: 17.9,
                                            height: 17.9,
                                            child: SizedBox(
                                                width: 17.9,
                                                height: 17.9,
                                                child: Container()),
                                          ),
                                          Text(
                                            '[선택] 광고성 정보 수신 동의',
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Color(0xFF7B8794),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 3, 13, 3),
                                        width: 17.9,
                                        height: 17.9,
                                        child: SizedBox(
                                            width: 17.9,
                                            height: 17.9,
                                            child: Container()),
                                      ),
                                      Text(
                                        '[선택] 개인정보 유효기간 - 탈퇴시까지',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF161616)),
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF161616),
                  ),
                  child: Container(
                    width: 341,
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    child: Text(
                      '회원가입',
                      style: GoogleFonts.getFont(
                        'Work Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        height: 1,
                        letterSpacing: 1.3,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
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
