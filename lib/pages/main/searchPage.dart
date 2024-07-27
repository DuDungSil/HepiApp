import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/dbHelper.dart';
import 'package:flutter_app/widgets/customBackButton.dart';
import 'package:flutter_app/widgets/eclipseText.dart';
import 'package:flutter_app/widgets/productCard/WideOptionProductCard.dart';
import 'package:flutter_app/widgets/resultFilter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import '../../router.dart';
import '../../utils/constants.dart';

class SearchPage extends StatefulWidget {
  final bool autoFocus;
  final String? query;
  final String? category;

  SearchPage({this.autoFocus = false, this.query, this.category});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> filters = ['스토어 랭킹순', '높은 가격순', '낮은 가격순', '판매량순', '최신순', '리뷰 많은순'];
  int filterIndex = 0;

  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  late final OverlayEntry overlayEntry;
  final GlobalKey _searchBarKey = GlobalKey();
  final LayerLink _searchBarLink = LayerLink();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    overlayEntry = OverlayEntry(builder: _overlayEntryBuilder);
    if (widget.query != null) {
      _textEditingController.text = widget.query!;
    }
  }

  @override
  void didUpdateWidget(covariant SearchPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      _textEditingController.text = widget.query ?? '';
    }
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
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

  void _autoComplete(TextEditingController _textEditingController, String keyword) {
    _textEditingController.text = keyword;
  }

  void _searchKeyword(BuildContext context, String keyword) async {
    if (keyword == '') return;
    if (widget.category != null) {
      context.go(Uri(
        path: '/search/c/${widget.category.toString()}',
        queryParameters: {'query': keyword},
      ).toString());
    } else {
      context.go(Uri(
        path: '/search',
        queryParameters: {'query': keyword},
      ).toString());
    }

    // 검색어 db 인서트(업데이트)
    DBHelper dbHelper = DBHelper();
    await dbHelper.insertOrUpdateSearchHistory(keyword);
    List<SearchHistory> histories = await dbHelper.fetchAllSearchHistory();
    histories.forEach((item) {
      print('ID: ${item.id}, Word: ${item.word}, DateTime: ${item.dateTime}');
    });

    removeOverlay();
    FocusScope.of(context).unfocus();
  }

  void _searchCategory(BuildContext context, String category) {
    context.go(Uri(
      path: '/search/c/${category}',
    ).toString());
  }

  Widget _overlayEntryBuilder(BuildContext context) {
    if (!mounted) {
      return Container(); // Return an empty container if the widget is not mounted
    }

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
          child: TextFieldTapRegion( // onTapOutside 무시영역 설정 위젯
            child: Container(
              color: Colors.white,
              child: AutoCompleteKeywordList(
                autoComplete: (keyword) {
                  _autoComplete(_textEditingController, keyword);
                },
                searchKeyword: _searchKeyword,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Offset _getOverlayEntryPosition() {
    try {
      RenderBox renderBox = _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
      return Offset(renderBox.localToGlobal(Offset.zero).dx, renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height);
    } catch (e) {
      return Offset.zero;
    }
  }

  Size _getOverlayEntrySize() {
    try {
      RenderBox renderBox = _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
      return renderBox.size;
    } catch (e) {
      return Size.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 검색 결과 있음
        if (widget.category != null || widget.query != null) ...[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              margin: Constants.SCREEN_HORIZONTAL_MARGIN,
              padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT),
              child: ScrollConfiguration(
                behavior: GlowBehavior(),
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.category != null) ...[
                              const SizedBox(
                                height: 15,
                              ),
                              Text(widget.category.toString(), style: Constants.getRobotoTxt(17, Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _searchCategory(context, 'WPI');
                                          },
                                          child: EclipseText(text: 'WPI')),
                                      GestureDetector(
                                          onTap: () {
                                            _searchCategory(context, 'WPC');
                                          },
                                          child: EclipseText(text: 'WPC')),
                                      GestureDetector(
                                          onTap: () {
                                            _searchCategory(context, '비건');
                                          },
                                          child: EclipseText(text: '비건')),
                                      GestureDetector(
                                          onTap: () {
                                            _searchCategory(context, '신상품');
                                          },
                                          child: EclipseText(text: '신상품')),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 60.0,
                        maxHeight: 60.0,
                        child: Column(
                          children: [
                            ResultFilter(
                              setView: () {},
                              filtering: () {
                                _showFilter();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          child: WideOptionProductCard(),
                        );
                      }, childCount: 10),
                    ),
                    SliverToBoxAdapter(
                      child: const SizedBox(
                        height: Constants.BOTTOM_MARGIN_WITH_BAR,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ] else ...[
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text('최근 검색어', style: Constants.getRobotoTxt(17, Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _autoComplete(_textEditingController, '삼대오백');
                                _searchKeyword(context, '삼대오백');
                              },
                              child: EclipseText(text: '삼대오백'),
                            ),
                            GestureDetector(
                              onTap: () {
                                _autoComplete(_textEditingController, '투퍼데이 종합비타민 120정');
                                _searchKeyword(context, '투퍼데이 종합비타민 120정');
                              },
                              child: EclipseText(text: '투퍼데이 종합비타민 120정'),
                            ),
                            GestureDetector(
                              onTap: () {
                                _autoComplete(_textEditingController, '잠백이 흑마늘');
                                _searchKeyword(context, '잠백이 흑마늘');
                              },
                              child: EclipseText(text: '잠백이 흑마늘'),
                            ),
                            GestureDetector(
                              onTap: () {
                                _autoComplete(_textEditingController, '프로틴');
                                _searchKeyword(context, '프로틴');
                              },
                              child: EclipseText(text: '프로틴'),
                            ),
                            GestureDetector(
                              onTap: () {
                                _autoComplete(_textEditingController, '크레아틴 500g');
                                _searchKeyword(context, '크레아틴 500g');
                              },
                              child: EclipseText(text: '크레아틴 500g'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('자주 구매한 상품', style: Constants.getRobotoTxt(17, Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: Color(0x1A000000)), borderRadius: BorderRadius.circular(6), color: Color(0x1A000000)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('할인 중인 상품', style: Constants.getRobotoTxt(17, Colors.black)),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: Color(0x1A000000)), borderRadius: BorderRadius.circular(6), color: Color(0x1A000000)),
                    ),
                    const SizedBox(
                      height: Constants.BOTTOM_MARGIN_WITH_BAR,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        // 맨 위로 스크롤 하는 버튼
        if (widget.category != null || widget.query != null)
          Positioned(
            bottom: Constants.BOTTOM_MARGIN_WITH_BAR,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                _scrollToTop();
              },
              child: Icon(Icons.arrow_upward),
            ),
          ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: '검색',
            leading: CustomBackButton(
              onTap: () {
                context.go('/home');
              },
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
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        'assets/vectors/search_normal_x2.svg',
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        autofocus: widget.autoFocus,
                        onSubmitted: (value) {
                          _searchKeyword(context, value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          hintText: '제품을 찾아보세요',
                          hintStyle: Constants.getPretendardTxt(15, Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey), // 기본 밑줄 색상
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF8A00)), // 포커스된 밑줄 색상
                          ),
                        ),
                        style: Constants.getPretendardTxt(15, Colors.black),
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
        ),
      ],
    );
  }

  void _showFilter() {
    // router에 정의된 showBottomSheet 사용 ( 네비게이션 상위 레이어 사용 )
    final showBottomSheet = context.findAncestorWidgetOfExactType<ScaffoldWithNavBar>()?.showBottomSheet;
    if (showBottomSheet != null) {
      showBottomSheet(
        Container(
          height: 420,
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
          child: Container(
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 40,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: Color(0xFFDBDBDB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: filters.length,
                      itemBuilder: (context, index) {
                        bool isSeleted = filterIndex == index;
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                filterIndex = index;
                              });
                              context.pop();
                            },
                            child: _buildBorderContainer(filters[index], isSeleted));
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildBorderContainer(String text, bool isSelected) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.black.withOpacity(0.2) : Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          height: 1.2,
          letterSpacing: -0.35,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class AutoCompleteKeywordList extends StatelessWidget {
  final Function(String) autoComplete;
  final Function(BuildContext, String) searchKeyword;

  AutoCompleteKeywordList({required this.searchKeyword, required this.autoComplete});

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

    return Container(
      height: 250.0,
      child: SingleChildScrollView(
        child: Column(
          children: keywords.map((keyword) {
            return Container(
              height: 36,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFF9EA3B2)),
                  bottom: BorderSide(color: Color(0xFF9EA3B2)),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: 24,
                    height: 24,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        'assets/vectors/clock.svg',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        autoComplete(keyword);
                        searchKeyword(context, keyword);
                      },
                      child: Text(
                        keyword,
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.2,
                          letterSpacing: -1.2,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      autoComplete(keyword);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 24,
                      height: 24,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          'assets/vectors/export.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child; // glow 효과 제거
  }
}
