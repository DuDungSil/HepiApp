import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class chattingPage extends StatefulWidget {
  @override
  State<chattingPage> createState() => _Page6State();
}

class _Page6State extends State<chattingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    //위젯이 처음 빌드될 때, 스크롤 컨트롤러를 사용하여 자동으로 스크롤을 아래로 이동시킵니다.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(// 스택
        children: [
      Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 72, 12, 0),
              child: Container(
                child: Text(
                  '전주 원웨이 피트니스',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                child: Text(
                  '🟢 현재 접속 중인 회원: 101명',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              // 센터 공지사항, 내프로필 설정 전체 컨테이너
              margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0D000000),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                child: Text(
                                  '📢',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    height: 1.6,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              '센터 공지사항',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.1,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0D000000),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                child: Text(
                                  '😎',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    height: 1.6,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              '내 프로필 설정',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.1,
                                color: Color(0xFF000000),
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
            Expanded(
              child: Container(
                // 채팅, 메시지 입력 컬럼
                margin: EdgeInsets.fromLTRB(12, 24, 12, 0),
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  children: [
                    Container(
                      // 채팅 1
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // 닉네임
                                    child: Text(
                                      '목표는삼대오백',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // 채팅 내용
                                    '골드 뉴트리션 프로틴이랑 초코 프로틴 교환하실 분!',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 채팅 2
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // 닉네임
                                    child: Text(
                                      '물근육입니다',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // 채팅 내용
                                    '오늘 운동 같이 하실분 계신가요?',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 채팅 3
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // 닉네임
                                    child: Text(
                                      '하체운동만하는사람',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // 채팅 내용
                                    '물근육님 운동 같이 하실래요?',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 채팅 4
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // 닉네임
                                    child: Text(
                                      '헬린이공주',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // 채팅 내용
                                    '이거 운동 어떻게 하는 줄 아시는 분ㅠㅠ',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 채팅 5
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // 닉네임
                                    child: Text(
                                      '물근육입니다',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // 채팅 내용
                                    '아 저 하체운동 어제 했습니다...',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 내 채팅
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      // 닉네임
                                      '헬스장 주인',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    Text(
                                      // 채팅 내용
                                      '헬린이 공주님 도움 필요하시면 데스크로 문의 주세요!',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.7,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(12, 0, 0, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 내 채팅
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      // 닉네임
                                      '헬스장 주인',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    Text(
                                      // 채팅 내용
                                      '헬린이 공주님 도움 필요하시면 데스크로 문의 주세요!',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.7,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(12, 0, 0, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 내 채팅
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      // 닉네임
                                      '헬스장 주인',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    Text(
                                      // 채팅 내용
                                      '헬린이 공주님 도움 필요하시면 데스크로 문의 주세요!',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.7,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // 사진
                                margin: EdgeInsets.fromLTRB(12, 0, 0, 6),
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x0D000000),
                                  ),
                                  child: SizedBox(
                                    width: 40,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(13, 7, 13, 7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                2.3, 0, 2.3, 1.3),
                                            child: SizedBox(
                                              width: 9.5,
                                              height: 9.5,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14.1,
                                            height: 9.2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_12_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // 구분선
                            child: Divider(
                              thickness: 0.3, // 두께
                              color: Colors.grey, // 색상
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
              margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x1A000000)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '메시지 입력...',
                  ),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0x80000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // 상단바
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 60,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // 투게더 텍스트
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '투게더',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 1.2,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text(
                        '🔔',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text(
                        '⚙️',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
