import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/sendChatting.dart';
import 'package:flutter_app/store/chattings.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/getChatting.dart';
import '../../function/getGymInfo.dart';
import '../../store/gym.dart';
import '../../store/user.dart';

class chattingPage extends StatefulWidget {
  @override
  State<chattingPage> createState() => _chattingPageState();
}

class _chattingPageState extends State<chattingPage> {
  final ScrollController _scrollController = ScrollController();
  var messageText = TextEditingController();
  var loginUser = null;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginUser = context.watch<user>();
  }

  @override
  Widget build(BuildContext context) {
    if (loginUser.id != null) {
      getChatting(context, context.read<gym>().id);
    }
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
            Consumer<gym>(builder: (consuer, gym, child) {
              if (gym.name == null) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  margin: EdgeInsets.fromLTRB(12, 72, 12, 0),
                  child: Container(
                    child: Text(
                      gym.name,
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                );
              }
            }),
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
            Consumer<chattings>(builder: (consumer, chattings, child) {
              if (chattings.chatList.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return Expanded(
                  child: Container(
                    // 채팅, 메시지 입력 컬럼
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: chattings.chatList.length,
                      itemBuilder: (context, i) {
                        return (chattings.chatList[i].user_id != loginUser.id)
                            ? Container(
                                // 채팅 1
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // 사진
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 12, 0),
                                          width: 40,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x0D000000),
                                            ),
                                            child: SizedBox(
                                              width: 40,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    13, 7, 13, 7),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // 닉네임
                                              child: Text(
                                                chattings.chatList[i].user_name,
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
                                              chattings.chatList[i].message,
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
                              )
                            : Container(
                                // 내 채팅
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                chattings.chatList[i].user_name,
                                                style: GoogleFonts.getFont(
                                                  'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  height: 1.3,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Text(
                                                // 채팅 내용
                                                chattings.chatList[i].message,
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
                                          margin:
                                              EdgeInsets.fromLTRB(12, 0, 0, 0),
                                          width: 40,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x0D000000),
                                            ),
                                            child: SizedBox(
                                              width: 40,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    13, 7, 13, 7),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 9.5,
                                                      height: 9.5,
                                                      child: SvgPicture.asset(
                                                        'assets/vectors/vector_6_x2.svg',
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
                              );
                      },
                    ),
                  ),
                );
              }
            }),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x1A000000)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageText,
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
                  Container(
                    // 메시지 전송 버튼
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        var response = await sendChatting(
                            context, loginUser.id, messageText.text);
                        if (response == "0") {
                          messageText.text = "";
                        } else {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: response,
                            ),
                            displayDuration: Duration(milliseconds: 500),
                          );
                        }
                      },
                      child: Text(
                        '전송',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ],
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
