import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/eclipseText.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final OverlayEntry overlayEntry;
  final GlobalKey _searchBarKey = GlobalKey();
  final LayerLink _searchBarLink = LayerLink();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    overlayEntry = OverlayEntry(builder: _overlayEntryBuilder);
  }

  void insertOverlay() {
    if (!overlayEntry.mounted) {
      OverlayState overlayState = Overlay.of(context)!;
      overlayState.insert(overlayEntry);
    }
  }

  void removeOverlay() {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  }

  Widget _overlayEntryBuilder(BuildContext context) {
    Offset position = _getOverlayEntryPosition();
    Size size = _getOverlayEntrySize();

    return Positioned(
      left: position.dx,
      top: position.dy,
      width: MediaQuery.of(context).size.width - Constants.SCREEN_HORIZONTAL_MARGIN.horizontal,
      child: CompositedTransformFollower(
        link: _searchBarLink,
        showWhenUnlinked: false,
        offset: Offset(0.0, size.height),
        child: Material(
          elevation: 4.0,
          child: Container(
            color: Colors.white,
            child: AutoCompleteKeywordList(
              onItemTap: (keyword) {
                _textEditingController.text = keyword;
                removeOverlay();
              },
            ),
          ),
        ),
      ),
    );
  }

  Offset _getOverlayEntryPosition() {
    RenderBox renderBox = _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
    return Offset(renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height);
  }

  Size _getOverlayEntrySize() {
    RenderBox renderBox = _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        removeOverlay();
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 160),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
                    child: Text(
                      '최근 검색어',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.2,
                        letterSpacing: -0.5,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          EclipseText(text: '삼대오백'),
                          EclipseText(text: '투퍼데이 종합비타민 120정'),
                          EclipseText(text: '잠백이 흑마늘'),
                          EclipseText(text: '프로틴'),
                          EclipseText(text: '크레아틴 500g'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Text(
                      '자주 구매한 상품',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.2,
                        letterSpacing: -0.5,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0x1A000000)),
                    child: Text(
                      "",
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        height: 1.3,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '할인 중인 상품',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2,
                          letterSpacing: -0.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0x1A000000)),
                    child: Text(
                      "",
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        height: 1.3,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {}, // Do nothing to prevent closing the overlay when tapping inside the search area
              child: Container(
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.center,
                height: 160,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: Text(
                        '검색',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 0,
                          letterSpacing: -0.5,
                          color: Color(0xFF111111),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF), // 배경색을 흰색으로 설정
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF9EA3B2), // 밑 선 색상을 회색으로 설정
                            width: 1,
                          ),
                        ),
                      ),
                      child: Container(
                        key: _searchBarKey,
                        child: CompositedTransformTarget(
                          link: _searchBarLink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 24,
                                height: 24,
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    'assets/vectors/search_normal_x2.svg',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _textEditingController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '제품을 찾아보세요',
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    height: 1,
                                    letterSpacing: -0.4,
                                    color: Color(0xFF000000),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      insertOverlay();
                                    } else {
                                      removeOverlay();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AutoCompleteKeywordList extends StatelessWidget {
  final Function(String) onItemTap;

  AutoCompleteKeywordList({required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    // Replace with your own list items
    List<String> keywords = [
      "삼대오백 부스터",
      "삼대오백 프로틴",
      "삼대오백 BCAA",
      "삼대오백 크레아틴",
      "삼대오백 아르기닌",
      "삼대오백 BCAA 프로",
      "삼대오백 글리펌프",
    ];

    return ListView.builder(
      padding: EdgeInsets.zero, // Remove padding
      shrinkWrap: true,
      itemCount: keywords.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(keywords[index]),
          onTap: () {
            onItemTap(keywords[index]);
          },
        );
      },
    );
  }
}
