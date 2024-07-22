import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_app/widgets/resultFilter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../widgets/productCard/WideOptionProductCard.dart';

class EventPage extends StatefulWidget {
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late CarouselController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: ScrollController(),
          slivers: [
            SliverToBoxAdapter(
              child: eventImages.eventImageList.isEmpty
                  ? Container(
                alignment: Alignment.center,
                height: 250,
                child: CircularProgressIndicator(),
              )
                  : Container(
                width: double.infinity,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            child: CarouselSlider(
                              carouselController: innerCarouselController,
                              items: eventImages.eventImageList.map((eventImage) {
                                return Container(
                                  child: CachedNetworkImage(
                                    imageUrl: eventImage.url,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
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
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(eventImages.eventImageList.length, (index) {
                        bool isSelected = innerCurrentPage == index;
                        return AnimatedContainer(
                          width: isSelected ? 8 : 8,
                          height: 8,
                          margin: EdgeInsets.symmetric(horizontal: isSelected ? 3 : 3),
                          duration: const Duration(milliseconds: 300),
                          decoration: ShapeDecoration(
                            color: isSelected ? Color(0xFF111111) : Color(0xFF9EA3B2),
                            shape: OvalBorder(),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: '진행 중인 이벤트',
          ),
        ),
      ],
    );
  }
}
