import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/eventPage.dart';
import 'package:flutter_app/pages/main/healthcarePage.dart';
import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/pages/main/searchPage.dart';
import 'package:flutter_app/pages/products/orderPage.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'package:flutter_app/pages/user/loginPage.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_app/widgets/customBottombar.dart';
import 'package:go_router/go_router.dart';

final pageList = [
  HomePage(), // INDEX 0  /home
  SearchPage(), // INDEX 1  /search
  MyPage(), // INDEX 2  /mypage
  HealthcarePage(), // INDEX 3  /healthcare
  QRPage(), // INDEX 4  /qr
  EventPage(), // INDEX 5  /home/event
  ProductDetailPage(), // INDEX 6  /productdetail
  LoginPage(), // INDEX 7  /login
  RegisterPage(), // INDEX 8  /register
  OrderPage() // INDEX 9  /register
];

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final routerNotifier = ValueNotifier<int>(0);

int _getIndexForLocation(Uri uri) {
  switch (uri.path) {
    case '/home':
      return 0;
    case '/search':
      return 1;
    case '/mypage':
      return 2;
    case '/healthcare':
      return 3;
    case '/qr':
      return 4;
    default:
      return 0;
  }
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  refreshListenable: routerNotifier,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _sectionANavigatorKey,
      builder:
          (BuildContext context, GoRouterState state, Widget navigationShell) {
        // 라우터 상태 변화 감지하여 routerNotifier 업데이트
        WidgetsBinding.instance.addPostFrameCallback((_) {
          int newIndex = _getIndexForLocation(state.uri);
          if (routerNotifier.value != newIndex) {
            routerNotifier.value = newIndex;
          }
        });
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) => pageList[0],
          routes: [
            GoRoute(
              path: 'event',
              builder: (BuildContext context, GoRouterState state) =>
              pageList[5],
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (BuildContext context, GoRouterState state) {
            final autoFocus =
                state.uri.queryParameters['focus'] == 'true' ?? false;
            return SearchPage(autoFocus: autoFocus);
          },
        ),
        GoRoute(
          path: '/mypage',
          builder: (BuildContext context, GoRouterState state) => pageList[2],
        ),
        GoRoute(
          path: '/healthcare',
          builder: (BuildContext context, GoRouterState state) => pageList[3],
        ),
        GoRoute(
          path: '/qr',
          builder: (BuildContext context, GoRouterState state) => pageList[4],
        ),
      ],
    ),
    GoRoute(
      path: '/productDetail',
      builder: (BuildContext context, GoRouterState state) => pageList[6],
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => pageList[7],
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) => pageList[8],
    ),
    GoRoute(
      path: '/order',
      builder: (BuildContext context, GoRouterState state) => pageList[9],
    ),
  ],
);

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final Widget navigationShell;

  @override
  _ScaffoldWithNavBarState createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: widget.navigationShell),
            Positioned(
              left: 0,
              right: 0,
              bottom: -1,
              child: ValueListenableBuilder<int>(
                valueListenable: routerNotifier,
                builder: (context, value, child) {
                  return CustomBottombar(
                    setTab: (index) {
                      final String? location = _getLocationForIndex(index);
                      if (location != null && location.isNotEmpty) {
                        router.go(location);
                      } else {
                        print("Invalid location for index $index: $location");
                      }
                    },
                    currentIndex: value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? _getLocationForIndex(int index) {
  switch (index) {
    case 0:
      return '/home';
    case 1:
      return '/search';
    case 2:
      return '/mypage';
    case 3:
      return '/healthcare';
    case 4:
      return '/qr';
    default:
      return '/home';
  }
}
