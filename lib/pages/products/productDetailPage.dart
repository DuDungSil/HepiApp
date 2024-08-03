import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_app/widgets/customBackButton.dart';
import 'package:flutter_app/widgets/eclipseText.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../../widgets/productCard/detailProductCard.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedIndex = 0; // 선택된 메뉴 항목의 인덱스를 추적
  ScrollController _scrollController = ScrollController();
  List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());
  List<double> _sectionOffsets = List.generate(5, (index) => 0.0); // 각 섹션의 위치를 저장할 리스트

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_calculateSectionOffsets);
    _scrollController.addListener(_onScroll);
  }

  void _calculateSectionOffsets(_) {
    for (int i = 0; i < _sectionKeys.length; i++) {
      RenderBox? box = _sectionKeys[i].currentContext?.findRenderObject() as RenderBox?;
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
        double bottom = top + (_sectionKeys[i].currentContext?.size?.height ?? 0);
        if (_scrollController.offset + Constants.APPBAR_TITLE_HEIGHT + 110 >= top && _scrollController.offset + Constants.APPBAR_TITLE_HEIGHT + 110 < bottom) {
          setState(() {
            selectedIndex = i;
          });
          break;
        }
      }
    });
  }

  void _scrollToIndex(int index) {
    RenderBox box = _sectionKeys[index].currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    _scrollController.animateTo(
      _scrollController.offset + position.dy - Constants.APPBAR_TITLE_HEIGHT - 110,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT),
              margin: Constants.SCREEN_HORIZONTAL_MARGIN,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo is ScrollEndNotification) {
                    _onScroll();
                  }
                  return true;
                },
                child: ScrollConfiguration(
                  behavior: GlowBehavior(),
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(margin: EdgeInsets.all(5), child: DetailProductCard()),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          minHeight: 50,
                          maxHeight: 50,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                Container(
                                  key: _sectionKeys[0],
                                  child: ProductSummary(),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  key: _sectionKeys[1],
                                  child: ProductInformation(),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  key: _sectionKeys[2],
                                  child: Column(
                                    children: [
                                      ProductIngredientInfo(),
                                      const SizedBox(height: 40),
                                      NutritionFacts(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  key: _sectionKeys[3],
                                  child: PersonalNutritionAnalysis(),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  key: _sectionKeys[4],
                                  child: CustomerReview(),
                                ),
                                const SizedBox(height: Constants.BOTTOM_MARGIN_WITH_BAR + 20),
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppbar(
                title: '상품 정보',
                leading: CustomBackButton(
                  onTap: () {
                    context.pop();
                  },
                ),
              ),
            )
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
          height: 40,
          child: Stack(
            children: [
              Center(
                child: Text(text, textAlign: TextAlign.center, style: Constants.getRobotoTxt(15, Colors.black)),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: 2,
                  color: isSelected ? Color(0xFFFF8A00) : Colors.transparent,
                ),
              ),
            ],
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

Widget ProductSummary() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('제품 요약', style: Constants.getPretendardTxt(18, Colors.black)),
      const SizedBox(height: 15),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          EclipseText(text: '스포츠 보충제'),
          EclipseText(text: '에너지 공급'),
          EclipseText(text: '운동 능력 개선'),
          EclipseText(text: '운동 전 섭취'),
        ],
      )
    ],
  );
}

Widget ProductInformation() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('제품 정보', style: Constants.getPretendardTxt(18, Colors.black)),
        const SizedBox(height: 15),
        Text(
            'California Gold Nutrition SPORT 분리유청단백질, 1lb\n단백질 27g, BCAA 6.1g, 글루탐산 4.6g\n무맛\n저유당 \n유전자 재조합 소 성장호르몬 무함유\n근육 성장 증진\n증량제, 글루텐, 유전자 변형 성분, 대두 무함유\n인공 색소, 인공 향료, 인공 감미료 무함유\ncGMP 인증 시설에서 생산\n100% 골드 개런티(Gold Guarantee)',
            style: Constants.getPretendardTxt(15, Colors.black87)),
      ],
    ),
  );
}

Widget ProductIngredientInfo() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('제품 성분 정보', style: Constants.getPretendardTxt(18, Colors.black)),
      const SizedBox(height: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(3),
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
            child: Text('1회 제공량: 1스쿱(5g) ', style: Constants.getPretendardTxt(13, Colors.black)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0x19767676),
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            child: Text('용기당 제공 횟수: 약 91회', style: Constants.getPretendardTxt(13, Colors.black)),
          ),
        ],
      ),
    ],
  );
}

Widget NutritionFacts() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('영양 성분 정보', style: Constants.getPretendardTxt(18, Colors.black)),
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        children: [
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('1회 제공량 당 함량', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('1일 영양성분\n기준치에 대한 비율', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
              ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text('칼로리', style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
          ]),
          TableRow(
              decoration: BoxDecoration(
                color: Color(0x19767676),
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
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('탄수화물', style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
              ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text('당류', style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
          ]),
          TableRow(
              decoration: BoxDecoration(
                color: Color(0x19767676),
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
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('단백질', style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
              ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text('지방', style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
            ),
          ]),
          TableRow(
              decoration: BoxDecoration(
                color: Color(0x19767676),
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
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('콜레스테롤', style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('나트륨', style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('0kcal', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('2%', textAlign: TextAlign.center, style: Constants.getPretendardTxt(13, Colors.black)),
                ),
              ]),
        ],
      ),
    ],
  );
}

Widget PersonalNutritionAnalysis() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('개인 영양 분석', style: Constants.getPretendardTxt(18, Colors.black)),
          Text('부족 0건 적합 0건 초과 0건', style: Constants.getPretendardTxt(12, Colors.grey)),
        ],
      ),
      const SizedBox(height: 10),
      Table(
        children: [
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '성분/함량',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '부족',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '적합',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '초과',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '비타민 A',
                        style: Constants.getPretendardTxt(14, Colors.black),
                      ),
                      Text(
                        '1740mcg RAE',
                        style: Constants.getPretendardTxt(12, Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '부족',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.5),
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )),
                  child: Text(
                    '적합',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '초과',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '비타민 B6',
                        style: Constants.getPretendardTxt(14, Colors.black),
                      ),
                      Text(
                        '120mg',
                        style: Constants.getPretendardTxt(12, Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '부족',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '적합',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  color: Colors.redAccent.withOpacity(0.5),
                  child: Text(
                    '초과',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '칼슘',
                        style: Constants.getPretendardTxt(14, Colors.black),
                      ),
                      Text(
                        '1400mg',
                        style: Constants.getPretendardTxt(12, Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.5),
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )),
                  child: Text(
                    '부족',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
                  child: Text(
                    '적합',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '초과',
                    style: Constants.getPretendardTxt(14, Colors.black),
                  ),
                ),
              ]),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25,
              width: 130,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Color(0xFFFF8A00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '상세정보 보기',
                textAlign: TextAlign.center,
                style: Constants.getRobotoTxt(12, Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25,
              width: 130,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Color(0xFFFF8A00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '내 정보 수정',
                textAlign: TextAlign.center,
                style: Constants.getRobotoTxt(12, Colors.white),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget CustomerReview() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('구매 후기', style: Constants.getPretendardTxt(18, Colors.black)),
          Text('더보기 >', style: Constants.getPretendardTxt(12, Colors.grey)),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            'assets/vectors/star_fill.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            'assets/vectors/star_fill.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            'assets/vectors/star_fill.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            'assets/vectors/star_fill.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            'assets/vectors/star_fill.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 15),
          Text('(673)', style: Constants.getRobotoTxt(15, Colors.black45)),
        ],
      ),
      const SizedBox(height: 10),
      Table(
        border: TableBorder.all(color: Colors.black.withOpacity(0.5), width: 1),
        children: [
          TableRow(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('이**', style: Constants.getRobotoTxt(13, Colors.black)),
                        Text('내 정보와 비교하기 >', style: Constants.getPretendardTxt(11, Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('20대 / 남 / 운동 강도 높음', style: Constants.getPretendardTxt(12, Colors.grey)),
                    const SizedBox(height: 5),
                    Text('좋아요! 추천합니다!', style: Constants.getPretendardTxt(13, Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ]
          ),
          TableRow(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('오**', style: Constants.getRobotoTxt(13, Colors.black)),
                          Text('내 정보와 비교하기 >', style: Constants.getPretendardTxt(11, Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text('20대 / 남 / 운동 강도 낮음', style: Constants.getPretendardTxt(12, Colors.grey)),
                      const SizedBox(height: 5),
                      Text('맛있어요, 또 먹고싶어요 !', style: Constants.getPretendardTxt(13, Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ]
          ),
        ],
      )
    ],
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

class GlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child; // glow 효과 제거
  }
}
