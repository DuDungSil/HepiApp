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
                    Consumer<eventImages>(builder: (consumer, eventImages, child) {
                      if (eventImages.eventImageList.isEmpty) {
                        return Container(
                            alignment: Alignment.center,
                            height: 164,
                            margin: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator());
                      } else {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              context.push('/home/event');
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(
                                      eventImages.eventImageList[1].url),
                                ),
                              ),
                            ),
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
                        return Container(
                            alignment: Alignment.center,
                            height: 250,
                            margin: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator());
                      } else {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: (products.eventProductList.length < 5)
                                ? products.eventProductList.length
                                : 5, // 카드의 개수를 설정합니다.
                            itemBuilder: (context, index) {
                              return Column(children: [
                                InkWell(
                                    onTap: () {
                                      context.push('/productdetail');
                                    },
                                    child: NormalProductCard(
                                        products.eventProductList[index]))
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
                                Expanded(
                                    child: CategoryBox('건강기능식품')
                                ),
                                const SizedBox(width: 8,),
                                Expanded(
                                    child: CategoryBox('단백질 보충제')
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: CategoryBox('프로틴 식품')
                                ),
                                const SizedBox(width: 8,),
                                Expanded(
                                    child: CategoryBox('비타민 / 미네랄')
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: CategoryBox('다이어트 보조제')
                                ),
                                const SizedBox(width: 8,),
                                Expanded(
                                    child: CategoryBox('간편한 식단')
                                ),
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
                          onTap: (){
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

  Widget CategoryBox(String text)
  {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding:
          EdgeInsets.fromLTRB(16, 134, 16, 12),
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
    );
  }