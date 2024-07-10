import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/productCard/detailProductCard.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedIndex = 0; // 선택된 메뉴 항목의 인덱스를 추적
  ScrollController _scrollController = ScrollController();
  List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());
  List<double> _sectionOffsets =
      List.generate(5, (index) => 0.0); // 각 섹션의 위치를 저장할 리스트

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_calculateSectionOffsets);
    _scrollController.addListener(_onScroll);
  }

  void _calculateSectionOffsets(_) {
    for (int i = 0; i < _sectionKeys.length; i++) {
      RenderBox? box =
          _sectionKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        Offset position = box.localToGlobal(Offset.zero);
        _sectionOffsets[i] = position.dy;
      }
    }
  }

  void _onScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < _sectionOffsets.length; i++) {
        double top = _sectionOffsets[i];
        double bottom =
            top + (_sectionKeys[i].currentContext?.size?.height ?? 0);
        print(top);
        print(bottom);
        if (_scrollController.offset + kToolbarHeight + 60 >= top &&
            _scrollController.offset + kToolbarHeight + 60 < bottom) {
          setState(() {
            selectedIndex = i;
          });
          break;
        }
      }
    });
  }

  void _scrollToIndex(int index) {
    RenderBox box =
        _sectionKeys[index].currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    _scrollController.animateTo(
      _scrollController.offset + position.dy - kToolbarHeight - 60,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo is ScrollEndNotification) {
                    _onScroll();
                  }
                  return true;
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(child: DetailProductCard()),
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
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildMenuItem('요약', 0),
                                    buildMenuItem('정보', 1),
                                    buildMenuItem('성분', 2),
                                    buildMenuItem('분석', 3),
                                    buildMenuItem('후기', 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: 2000,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                key: _sectionKeys[0],
                                child: ProductSummary(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                key: _sectionKeys[1],
                                child: ProductInformation(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                key: _sectionKeys[2],
                                child: Column(
                                  children: [
                                    ProductIngredientInfo(),
                                    Container(
                                      height: 25,
                                    ),
                                    NutritionFacts(),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                key: _sectionKeys[3],
                                child: PersonalNutritionAnalysis(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                key: _sectionKeys[4],
                                child: CustomerReview(),
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '상품 정보',
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String text, int index) {
    bool isSelected = index == selectedIndex;
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index; // 항목을 클릭할 때 선택된 인덱스를 변경
          });
          _scrollToIndex(index);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Color(0xFFFF8A00) : Color(0xFF767676),
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                // 텍스트 크기 조정
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 1.2,
                letterSpacing: -0.5,
              ),
            ),
          ),
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

Widget ProductSummary() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              child: Text(
                '제품 요약',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                  letterSpacing: -0.45,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 342,
                    height: 46,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EllipseText('스포츠 보충제'),
                        const SizedBox(width: 8),
                        EllipseText('운동전 섭취'),
                        const SizedBox(width: 8),
                        EllipseText('에너지 공급'),
                      ],
                    ),
                  ),
                  EllipseText('운동 능력 개선')
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget ProductInformation() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          child: Text(
            '제품 정보',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            'California Gold Nutrition SPORT 분리유청단백질, 1lb\n단백질 27g, BCAA 6.1g, 글루탐산 4.6g\n무맛\n저유당 \n유전자 재조합 소 성장호르몬 무함유\n근육 성장 증진\n증량제, 글루텐, 유전자 변형 성분, 대두 무함유\n인공 색소, 인공 향료, 인공 감미료 무함유\ncGMP 인증 시설에서 생산\n100% 골드 개런티(Gold Guarantee)',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.6,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ProductIngredientInfo() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          child: Text(
            '제품 성분 정보',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0x19FAFAFA),
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1회 제공량: 1스쿱(5g) ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                          letterSpacing: -0.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0x19767676),
                    border: Border(
                      top: BorderSide(color: Colors.black.withOpacity(0.5)),
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '용기당 제공 횟수: 약 91회',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                          letterSpacing: -0.35,
                        ),
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
  );
}

Widget NutritionFacts() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          child: Text(
            '영양 성분 정보',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 260,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                    ), // 여백
                    Container(
                      width: 115,
                      child: Text(
                        '1회 제공량 당 함량',
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
                    ),
                    Container(
                      width: 110,
                      child: Text(
                        '1일 영양성분\n기준치에 대한 비율',
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
                    ),
                  ],
                ),
              ),
              NutritionFactsCell(Color(0x19FAFAFA), '칼로리'),
              NutritionFactsCell(Color(0x19767676), '탄수화물'),
              NutritionFactsCell(Color(0x19FAFAFA), '당류'),
              NutritionFactsCell(Color(0x19767676), '단백질'),
              NutritionFactsCell(Color(0x19FAFAFA), '지방'),
              NutritionFactsCell(Color(0x19767676), '콜레스테롤'),
              NutritionFactsCell(Color(0x19FAFAFA), '나트륨'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          width: 342,
          child: Text(
            '1일 영양성분 기준치에 대한 비율은 2000 kcal 기준이므로 개인의 필요 역량에 따라 다를 수 있습니다.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget EllipseText(var text) {
  return Container(
    padding: const EdgeInsets.all(15),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF191919),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0.1,
            letterSpacing: -0.35,
          ),
        ),
      ],
    ),
  );
}

Widget PersonalNutritionAnalysis() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          child: Text(
            '개인 영양 분석',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          height: 200,
        )
      ],
    ),
  );
}

Widget CustomerReview() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          child: Text(
            '구매 후기',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.08,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          height: 200,
        )
      ],
    ),
  );
}

Widget NutritionFactsCell(color, name) {
  return Expanded(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.5),
          ),
          bottom: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 0.09,
              letterSpacing: -0.35,
            ),
          ),
        ],
      ),
    ),
  );
}
