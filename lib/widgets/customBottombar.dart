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
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 20.0,
          selectedIconTheme: IconThemeData(size: 28.0),
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 16.0,
          unselectedFontSize: 12.0,
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/home_icon.svg',
                width: 20,
                height: 20,
                color: currentIndex == 0 ? Colors.orange : Colors.black,
              ),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/search_icon.svg',
                width: 20,
                height: 20,
                color: currentIndex == 1 ? Colors.orange : Colors.black,
              ),
              label: "검색",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/mypage_icon.svg',
                width: 20,
                height: 20,
                color: currentIndex == 2 ? Colors.orange : Colors.black,
              ),
              label: "마이페이지",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/healthy_icon.svg',
                width: 20,
                height: 20,
                color: currentIndex == 3 ? Colors.orange : Colors.black,
              ),
              label: "건강 관리",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/qr_icon.svg',
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
