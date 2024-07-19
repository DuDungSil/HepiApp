import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_app/widgets/productCard/normalProductCard.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants.dart';

import '../../function/getEventImage.dart';
import '../../function/getProduct.dart';
import '../../store/eventImages.dart';
import '../../store/products.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late CarouselController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState(){
    innerCarouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getProduct(context, "event", "");
    getEventImage(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 120),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              margin: Constants.SCREEN_HORIZONTAL_MARGIN,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // 할인정보 텍스트
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        '진행 중인 이벤트',
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
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<eventImages>(builder: (consumer, eventImages, child) {
                    if (eventImages.eventImageList.isEmpty) {
                      return Container(alignment: Alignment.center, height: 230, child: CircularProgressIndicator());
                    } else {
                      return Container(
                        width: double.infinity,
                        height: 230,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 35,
                                    child: SvgPicture.asset(
                                      'assets/vectors/arrow_left.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0x1A000000)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context.push('/home/event');
                                          });
                                        },
                                        child: Container(
                                          height: 200,
                                          child: CarouselSlider(
                                            carouselController: innerCarouselController,
                                            items: eventImages.eventImageList.map((eventImage) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: NetworkImage(eventImage.url),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  innerCurrentPage = index;
                                                });
                                              },
                                              viewportFraction: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 35,
                                    child: SvgPicture.asset(
                                      'assets/vectors/arrow_right.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: List.generate(eventImages.eventImageList.length, (index) {
                                bool isSelected = innerCurrentPage == index;
                                return AnimatedContainer(
                                    width: ,
                                    height: 10,
                                    color: isSelected,
                                    duration: const Duration(milliseconds: 300,)
                                );
                              }),
                            )
                            // Container(
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: List.generate(eventImages.eventImageList.length, (index) {
                            //       return Padding(
                            //         padding: const EdgeInsets.all(5.0), // 이미지 간의 간격 조절
                            //         child: Container(
                            //           width: 6,
                            //           height: 6,
                            //           decoration: ShapeDecoration(
                            //             color: currentIndex == index
                            //                 ? Color(0xFF111111)
                            //                 : Color(0xFF9EA3B2),
                            //             shape: OvalBorder(),
                            //           ),
                            //         ),
                            //       );
                            //     }),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }
                  }),
                  Container(
                    // 할인 중인 품목 텍스트
                    margin: EdgeInsets.only(top: 30),
                    child: Container(
                      child: Text(
                        '할인 중인 품목',
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
                  Consumer<products>(builder: (consumer, products, child) {
                    if (products.eventProductList.isEmpty) {
                      return Container(alignment: Alignment.center, height: 250, margin: EdgeInsets.only(top: 20), child: CircularProgressIndicator());
                    } else {
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 230,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: (products.eventProductList.length < 5) ? products.eventProductList.length : 5, // 카드의 개수를 설정합니다.
                          itemBuilder: (context, index) {
                            return Column(children: [
                              InkWell(
                                  onTap: () {
                                    context.push('/productdetail');
                                  },
                                  child: NormalProductCard(products.eventProductList[index]))
                            ]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                        ),
                      );
                    }
                  }),
                  Container(
                    // 카테고리 별 쇼핑 텍스트
                    margin: EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          '카테고리 별 쇼핑',
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
                  ),
                  Container(
                    // 전체 물품 카테고리 컨테이너
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: CategoryBox(context, '건강기능식품', '/search/c/건강기능식품')),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(child: CategoryBox(context, '단백질 보충제', '/search/c/단백질 보충제')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: CategoryBox(context, '프로틴 식품', '/search/c/프로틴 식품')),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(child: CategoryBox(context, '비타민 & 미네랄', '/search/c/비타민 & 미네랄')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: CategoryBox(context, '다이어트 보조제', '/search/c/다이어트 보조제')),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(child: CategoryBox(context, '간편한 식단', '/search/c/간편한 식단')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
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
            title: "헤파이 스토어",
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
                        onTap: () {
                          context.go('/search?focus=true');
                        },
                        readOnly: true,
                        decoration: InputDecoration(
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
}

Widget CategoryBox(BuildContext context, String text, String path) {
  return Container(
    child: InkWell(
      onTap: () {
        context.go(path);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 134, 16, 12),
          child: Text(
            text,
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w300,
              fontSize: 18,
              height: 1.2,
              letterSpacing: -0.5,
              color: Color(0xFF191919),
            ),
          ),
        ),
      ),
    ),
  );
}
