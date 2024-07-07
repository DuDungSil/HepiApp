import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../store/user.dart';

class Bottombar extends StatefulWidget {
  final Function(int) setTab;

  Bottombar({Key? key, required this.setTab}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // if (index == 3 && context.read<user>().id == null) {
    //   showTopSnackBar(
    //     Overlay.of(context),
    //     CustomSnackBar.error(
    //       message: '로그인 후 이용해주세요',
    //     ),
    //     displayDuration: Duration(milliseconds: 500),
    //   );
    // } else {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
      setState(() {
        _selectedIndex = index;
        widget.setTab(index);
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/home_icon.svg',
                width: 20,
                height: 20,
                color: _selectedIndex == 0 ? Colors.orange : Colors.black,
              ),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/search_icon.svg',
                width: 20,
                height: 20,
                color: _selectedIndex == 1 ? Colors.orange : Colors.black,
              ),
              label: "검색",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/mypage_icon.svg',
                width: 20,
                height: 20,
                color: _selectedIndex == 2 ? Colors.orange : Colors.black,
              ),
              label: "마이페이지",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/healthy_icon.svg',
                width: 20,
                height: 20,
                color: _selectedIndex == 3 ? Colors.orange : Colors.black,
              ),
              label: "건강 관리",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/vectors/Bottombar/qr_icon.svg',
                width: 20,
                height: 20,
                color: _selectedIndex == 4 ? Colors.orange : Colors.black,
              ),
              label: "QR코드",
            ),
          ],
        ),
      ),
    );
  }
}
