import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/init/startLoginPage.dart';
import 'package:flutter_app/pages/init/startPage.dart';
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
import 'package:flutter_app/store/user.dart';
import 'package:flutter_app/widgets/customBottombar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';



final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<_ScaffoldWithNavBarState> _scaffoldKey = GlobalKey<_ScaffoldWithNavBarState>();

final routerNotifier = ValueNotifier<int>(0);

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  refreshListenable: routerNotifier,
  redirect: (context, state) {
    final bool isOnboardingComplete = sharedPreferences.getBool('onboardingComplete') ?? false;

    if (!isOnboardingComplete && state.uri.path != '/onboarding') {
      return '/onboarding';
    }

    if (isOnboardingComplete && state.uri.path == '/onboarding') {
      return '/home';
    }

    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) => startPage(),
    ),
    GoRoute(
      path: '/startLogin',
      builder: (BuildContext context, GoRouterState state) => startLoginPage(),
    ),
    ShellRoute(
      navigatorKey: _sectionANavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget navigationShell) {
        // 라우터 상태 변화 감지하여 routerNotifier 업데이트
        WidgetsBinding.instance.addPostFrameCallback((_) {
          int newIndex = _getIndexForLocation(state.uri);
          if (routerNotifier.value != newIndex) {
            routerNotifier.value = newIndex;
          }
        });
        return ScaffoldWithNavBar(
          key: _scaffoldKey,
          navigationShell: navigationShell,
          showBottomSheet: (widget) {
            _scaffoldKey.currentState?.showBottomSheet(widget);
          },
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) => HomePage(),
          routes: [
            GoRoute(
              path: 'event/:id',
              builder: (BuildContext context, GoRouterState state) {
                final id = int.parse(state.pathParameters['id']!);
                return EventPage(viewID: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (BuildContext context, GoRouterState state) {
            final autoFocus = state.uri.queryParameters['focus'] == 'true' ?? false;
            final query = state.uri.queryParameters['query'];

            return SearchPage(autoFocus: autoFocus, query: query);
          },
          routes: [
            GoRoute(
              path: 'c/:category',
              builder: (BuildContext context, GoRouterState state) {
                final autoFocus = state.uri.queryParameters['focus'] == 'true' ?? false;
                final category = state.pathParameters['category']!;
                final query = state.uri.queryParameters['query'];

                return SearchPage(autoFocus: autoFocus, category: category, query: query);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/mypage',
          builder: (BuildContext context, GoRouterState state) => MyPage(),
        ),
        GoRoute(
            path: '/healthcare',
            builder: (BuildContext context, GoRouterState state) => HealthcarePage(),
            redirect: (context, state) {
              if (context.read<user>().id != null)
                return '/healthcare';
              else
                return '/login';
            }),
        GoRoute(
            path: '/qr',
            builder: (BuildContext context, GoRouterState state) => QRPage(),
            redirect: (context, state) {
              if (context.read<user>().id != null)
                return '/qr';
              else
                return '/login';
            }),
      ],
    ),
    GoRoute(
      path: '/productDetail',
      builder: (BuildContext context, GoRouterState state) => ProductDetailPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) => RegisterPage(),
    ),
    GoRoute(
      path: '/order',
      builder: (BuildContext context, GoRouterState state) => OrderPage(),
    ),
  ],
);

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.showBottomSheet,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final Widget navigationShell;
  final void Function(Widget) showBottomSheet;

  @override
  _ScaffoldWithNavBarState createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  void showBottomSheet(Widget widget) {
    showModalBottomSheet(
      context: context,
      builder: (context) => widget,
    );
  }

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

String getFirstPathSegment(Uri uri) {
  if (uri.pathSegments.isNotEmpty) {
    return '/' + uri.pathSegments.first;
  }
  return '/';
}

int _getIndexForLocation(Uri uri) {
  final firstPath = getFirstPathSegment(uri);
  switch (firstPath) {
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