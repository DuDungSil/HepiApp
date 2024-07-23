import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/customBackButton.dart';
import 'package:flutter_app/widgets/eclipseText.dart';
import 'package:flutter_app/widgets/productCard/WideOptionProductCard.dart';
import 'package:flutter_app/widgets/resultFilter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
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
    // 여기서 상태를 업데이트
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

  void _autoComplete(
      TextEditingController _textEditingController, String keyword) {
    _textEditingController.text = keyword;
  }

  void _searchKeyword(BuildContext context, String keyword) {
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
      width: MediaQuery.of(context).size.width -
          Constants.SCREEN_HORIZONTAL_MARGIN.horizontal,
      child: CompositedTransformFollower(
        link: _searchBarLink,
        showWhenUnlinked: false,
        offset: Offset(0.0, size.height),
        child: Material(
          elevation: 4.0,
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
    );
  }

  Offset _getOverlayEntryPosition() {
    try {
      RenderBox renderBox =
          _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
      return Offset(renderBox.localToGlobal(Offset.zero).dx,
          renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height);
    } catch (e) {
      return Offset.zero;
    }
  }

  Size _getOverlayEntrySize() {
    try {
      RenderBox renderBox =
          _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
      return renderBox.size;
    } catch (e) {
      return Size.zero;
    }
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
          // 검색 결과 있음
          if (widget.category != null || widget.query != null) ...[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                padding: EdgeInsets.only(top: 120),
                child: CustomScrollView(
                  controller: ScrollController(),
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
                            const SizedBox(
                              height: 20,
                            ),
                            if (widget.category != null) ...[
                              Container(
                                child: Text(
                                  widget.category.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
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
                              // 검색 결과를 표시하는 위젯
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
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ResultFilter(
                                setView: () {},
                                filtering: () {_showFilter();},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                          child: WideOptionProductCard(),
                        );
                      }, childCount: 10),
                    ),
                    SliverToBoxAdapter(
                      child: const SizedBox(
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
            )
          ] else ...[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 120),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Container(
                  margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                        margin: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
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
                                  _autoComplete(_textEditingController,
                                      '투퍼데이 종합비타민 120정');
                                  _searchKeyword(context, '투퍼데이 종합비타민 120정');
                                },
                                child: EclipseText(text: '투퍼데이 종합비타민 120정'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _autoComplete(
                                      _textEditingController, '잠백이 흑마늘');
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
                                  _autoComplete(
                                      _textEditingController, '크레아틴 500g');
                                  _searchKeyword(context, '크레아틴 500g');
                                },
                                child: EclipseText(text: '크레아틴 500g'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0x1A000000)),
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0x1A000000)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0x1A000000)),
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0x1A000000)),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              // Do nothing to prevent closing the overlay when tapping inside the search area
              child: CustomAppbar(
                title: '검색',
                leading: CustomBackButton(
                  onTap: () {
                    context.go('/home');
                  },
                ),
                child: Container(
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
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                              autofocus: widget.autoFocus,
                              onSubmitted: (value) {
                                _searchKeyword(context, value);
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                                hintText: '제품을 찾아보세요',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.40,
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.2,
                                letterSpacing: -1.2,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilter(){
    showModalBottomSheet(
      context : context,
      builder : (BuildContext context){
        return Container(
          width: 390,
          height: 405,
          decoration: ShapeDecoration(
            color: Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
        );
      }
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class AutoCompleteKeywordList extends StatelessWidget {
  final Function(String) autoComplete;
  final Function(BuildContext, String) searchKeyword;

  AutoCompleteKeywordList(
      {required this.searchKeyword, required this.autoComplete});

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

