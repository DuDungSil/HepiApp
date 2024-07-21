import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';

class startPage extends StatefulWidget {
  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: Constants.SCREEN_HORIZONTAL_MARGIN,
          child: Column(
            children: [
              Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/onboard1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            '간편하게\n제품을 구매하세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.80,
                            ),
                          ),
                          Text(
                            '헤파이에서는 온라인에서 구매 후\n즉시 오프라인에서 수령이 가능합니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/onboard2.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            '나에게 맞는 제품을\n추천받아보세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.80,
                            ),
                          ),
                          Text(
                            '헤파이에서는 검증된 통계자료를 학습한 AI 기술로\n나에게 맞는 제품을 추천드립니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/onboard1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            '간편하게 \n제품을 구매하세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.80,
                            ),
                          ),
                          Text(
                            '헤파이에서는 온라인에서 구매 후 \n즉시 오프라인에서 수령이 가능합니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => _buildTab(index)),
              ),
              GestureDetector(
                onTap: () {
                  sharedPreferences.setBool('onboardingComplete', true);
                  context.go('/startLogin');
                },
                child: Container(
                  height: 60,
                  margin: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF8A00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    '시작하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: -0.45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.fromLTRB(10,10,10,20),
        width: isSelected ? 32 : 8,
        height: isSelected ? 8 : 8,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF8A00) : Color(0xFF626877),
          borderRadius: BorderRadius.circular(isSelected ? 8.0 : 7.5),
        ),
      ),
    );
  }
}
