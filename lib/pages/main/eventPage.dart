import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_app/widgets/resultFilter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../function/getEventImage.dart';
import '../../widgets/customBackButton.dart';
import '../../widgets/productCard/WideOptionProductCard.dart';

class EventPage extends StatefulWidget {
  final int viewID;

  EventPage({Key? key, this.viewID = 0}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late CarouselController innerCarouselController;
  late int innerCurrentPage;

  @override
  void initState() {
    innerCarouselController = CarouselController();
    innerCurrentPage = widget.viewID;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getEventImage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Container(
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Consumer<eventImages>(
                    builder: (context, eventImages, child) {
                      if (eventImages.eventImageList.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          height: 250,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250,
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
                                initialPage: innerCurrentPage,
                                onPageChanged: (index, reason) {
                                  if (innerCurrentPage != index) {
                                    setState(() {
                                      innerCurrentPage = index;
                                    });
                                  }
                                },
                                viewportFraction: 1.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(eventImages.eventImageList.length, (index) {
                              bool isSelected = innerCurrentPage == index;
                              return AnimatedContainer(
                                width: 8,
                                height: 8,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                duration: const Duration(milliseconds: 300),
                                decoration: ShapeDecoration(
                                  color: isSelected ? Color(0xFF111111) : Color(0xFF9EA3B2),
                                  shape: OvalBorder(),
                                ),
                              );
                            }),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 20,),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 60.0,
                    maxHeight: 60.0,
                    child: Container(
                      color: Colors.white,
                      child: ResultFilter(
                        setView: () {},
                        filtering: () {},
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: WideOptionProductCard(),
                      );
                    },
                    childCount: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 100,
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
          child: CustomAppbar(
            title: '진행 중인 이벤트',
            leading: CustomBackButton(
              onTap: () {
                context.pop();
              },
            ),
          ),
        ),
      ],
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
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
