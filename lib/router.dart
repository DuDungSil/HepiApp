import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/eventPage.dart';
import 'package:flutter_app/pages/main/healthcarePage.dart';
import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/pages/main/searchPage.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'package:flutter_app/pages/user/loginPage.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_app/widgets/customBottombar.dart';
import 'package:go_router/go_router.dart';

final PageList = [
  HomePage(),                      // INDEX 0  /home
  SearchPage(),                    // INDEX 1  /search
  MyPage(),                        // INDEX 2  /mypage
  HealthcarePage(),                // INDEX 3  /healthcare
  QRPage(),                        // INDEX 4  /qr
  EventPage(),                     // INDEX 5  /home/event
  ProductDetailPage(),             // INDEX 6  /productdetail
  LoginPage(),                     // INDEX 7  /login
  RegisterPage()                   // INDEX 8  /register
];

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) =>
                PageList[0],
                routes: <RouteBase>[
                  GoRoute(
                    path: 'event',
                    builder: (BuildContext context, GoRouterState state) =>
                    PageList[5],
                  )
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              builder: (BuildContext context, GoRouterState state) =>
              PageList[1],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/mypage',
              builder: (BuildContext context, GoRouterState state) => PageList[2],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/healthcare',
              builder: (BuildContext context, GoRouterState state) =>
              PageList[3],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/qr',
              builder: (BuildContext context, GoRouterState state) => PageList[4],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/productdetail',
      builder: (BuildContext context, GoRouterState state) =>
      PageList[6],
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
      PageList[7],
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) =>
      PageList[8],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: navigationShell),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottombar(setTab: _onTap),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
