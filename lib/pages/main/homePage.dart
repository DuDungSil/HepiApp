import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_app/widgets/productCard/normalProductCard.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    innerCarouselController = CarouselController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getProduct(context, "event", "");
    getEventImage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT),
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text('진행 중인 이벤트', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Consumer<eventImages>(builder: (consumer, eventImages, child) {
                  if (eventImages.eventImageList.isEmpty) {
                    return Container(alignment: Alignment.center, height: 200, child: CircularProgressIndicator());
                  } else {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    context.push('/home/event/${innerCurrentPage}');
                                  });
                                },
                                child: Container(
                                  height: 200,
                                  child: CarouselSlider(
                                    carouselController: innerCarouselController,
                                    items: eventImages.eventImageList.map((eventImage) {
                                      return Container(
                                        child: CachedNetworkImage(
                                          imageUrl: eventImage.url,
                                          placeholder: (context, url) => Center(
                                            child: Constants.defalutProgressIndicatorWidget,
                                          ),
                                          errorWidget: (context, url, error) => Constants.defalutErrorWidget,
                                          fit: BoxFit.contain,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(eventImages.eventImageList.length, (index) {
                                bool isSelected = innerCurrentPage == index;
                                return AnimatedContainer(
                                    width: isSelected ? 6 : 6,
                                    height: 6,
                                    margin: EdgeInsets.symmetric(horizontal: isSelected ? 3 : 3),
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    decoration: ShapeDecoration(color: isSelected ? Color(0xFF111111) : Color(0xFF9EA3B2), shape: OvalBorder()));
                              }),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 15,
                ),
                Text('할인 중인 품목', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Consumer<products>(builder: (consumer, products, child) {
                  if (products.eventProductList.isEmpty) {
                    return Container(alignment: Alignment.center, height: 200, child: CircularProgressIndicator());
                  } else {
                    return Container(
                      height: 200,
                      clipBehavior: Clip.none,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.eventProductList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                context.push('/productdetail');
                              },
                              child: NormalProductCard(products.eventProductList[index]));
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 15,
                ),
                Text('카테고리 별 쇼핑', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Column(
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
                  ],
                ),
                const SizedBox(
                  height: Constants.BOTTOM_MARGIN_WITH_BAR,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: "헤파이 스토어",
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
                    onTap: () {
                      context.go('/search?focus=true');
                    },
                    readOnly: true,
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
                  ),
                ),
              ],
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
