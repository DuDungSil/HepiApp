import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottombar extends StatelessWidget {
  final Function(int) setTab;
  final int currentIndex;

  CustomBottombar({Key? key, required this.setTab, required this.currentIndex}) : super(key: key);

  void _onItemTapped(int index) {
    setTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 11.0,
          unselectedFontSize: 9.0,
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/home_icon.svg',
                key: Key('home_icon'),
                width: 20,
                height: 20,
                color: currentIndex == 0 ? Colors.orange : Colors.black,
              ),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/search_icon.svg',
                key: Key('search_icon'),
                width: 20,
                height: 20,
                color: currentIndex == 1 ? Colors.orange : Colors.black,
              ),
              label: "검색",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/mypage_icon.svg',
                key: Key('mypage_icon'),
                width: 20,
                height: 20,
                color: currentIndex == 2 ? Colors.orange : Colors.black,
              ),
              label: "마이페이지",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/healthy_icon.svg',
                key: Key('healthy_icon'),
                width: 20,
                height: 20,
                color: currentIndex == 3 ? Colors.orange : Colors.black,
              ),
              label: "건강 관리",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/qr_icon.svg',
                key: Key('qr_icon'),
                width: 20,
                height: 20,
                color: currentIndex == 4 ? Colors.orange : Colors.black,
              ),
              label: "QR코드",
            ),
          ],
        ),
      ),
    );
  }
}
