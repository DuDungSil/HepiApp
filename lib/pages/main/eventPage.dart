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
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
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
  final ScrollController _scrollController = ScrollController();
  late CarouselController innerCarouselController;
  late int innerCurrentPage;

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<int> _items = List.generate(10, (index) => index);

  @override
  void initState() {
    innerCarouselController = CarouselController();
    innerCurrentPage = widget.viewID;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getEventImage(context);
    });

    // PullDown 오버스크롤 막기 (중요)
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < _scrollController.position.minScrollExtent) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }

  void _onLoading() async {
    // Simulate fetching data from the server
    await Future.delayed(Duration(seconds: 2));
    List<int> newItems = List.generate(10, (index) => _items.length + index);

    if (mounted) {
      setState(() {
        _items.addAll(newItems);
      });
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: Constants.SCREEN_HORIZONTAL_MARGIN,
          padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: false,
            enablePullUp: true,
            onLoading: _onLoading,
            footer: const ClassicFooter(
              spacing: 0,
              loadingText: '',
              canLoadingText: '',
              idleText: '',
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Consumer<eventImages>(
                    builder: (context, eventImages, child) {
                      if (eventImages.eventImageList.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          height: 200,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
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
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(eventImages.eventImageList.length, (index) {
                              bool isSelected = innerCurrentPage == index;
                              return AnimatedContainer(
                                width: 6,
                                height: 6,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                duration: const Duration(milliseconds: 300),
                                decoration: ShapeDecoration(
                                  color: isSelected ? Color(0xFF111111) : Color(0xFF9EA3B2),
                                  shape: OvalBorder(),
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
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(eventImages.eventImageList.length, (index) {
                            bool isSelected = innerCurrentPage == index;
                            return AnimatedContainer(
                              width: 6,
                              height: 6,
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
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 60.0,
                    maxHeight: 60.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
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
                        padding: EdgeInsets.all(5),
                        child: WideOptionProductCard(),
                      );
                    },
                    childCount: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ],
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
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
