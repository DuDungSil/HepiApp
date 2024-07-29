import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/init/startLoginPage.dart';
import 'package:flutter_app/pages/init/startPage.dart';
import 'package:flutter_app/pages/main/eventPage.dart';
import 'package:flutter_app/pages/main/healthcarePage.dart';
import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/pages/main/searchPage.dart';
import 'package:flutter_app/pages/products/cartPage.dart';
import 'package:flutter_app/pages/products/orderPage.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'package:flutter_app/pages/products/showMoreProducts.dart';
import 'package:flutter_app/pages/user/findAccountPage.dart';
import 'package:flutter_app/pages/user/findIdPage.dart';
import 'package:flutter_app/pages/user/loginPage.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_app/widgets/customBottombar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<_ScaffoldWithNavBarState> _scaffoldKey = GlobalKey<_ScaffoldWithNavBarState>();

final routerNotifier = ValueNotifier<int>(0);

Page<dynamic> buildCustomTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

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
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(startPage()),
    ),
    GoRoute(
      path: '/startLogin',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(StartLoginPage()),
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
          pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(HomePage()),
          routes: [
            GoRoute(
              path: 'event/:id',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final id = int.parse(state.pathParameters['id']!);
                return buildCustomTransitionPage(EventPage(viewID: id));
              },
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final autoFocus = state.uri.queryParameters['focus'] == 'true' ?? false;
            final query = state.uri.queryParameters['query'];
            return buildCustomTransitionPage(SearchPage(autoFocus: autoFocus, query: query));
          },
          routes: [
            GoRoute(
              path: 'c/:category',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final autoFocus = state.uri.queryParameters['focus'] == 'true' ?? false;
                final category = state.pathParameters['category']!;
                final query = state.uri.queryParameters['query'];
                return buildCustomTransitionPage(SearchPage(autoFocus: autoFocus, category: category, query: query));
              },
            ),
            GoRoute(
              path: 'more',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildCustomTransitionPage(ShowMoreProducts());
              },
            ),
          ],
        ),
        GoRoute(
          path: '/mypage',
          pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(MyPage()),
        ),
        GoRoute(
            path: '/healthcare',
            pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(HealthcarePage()),
            redirect: (context, state) {
              if (context.read<user>().id != null)
                return '/healthcare';
              else
                return '/login?redirect=/healthcare';
            }),
        GoRoute(
            path: '/qr',
            pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(QRPage()),
            redirect: (context, state) {
              if (context.read<user>().id != null)
                return '/qr';
              else
                return '/login?redirect=/qr';
            }),
      ],
    ),
    GoRoute(
      path: '/productDetail',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(ProductDetailPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state){
        final redirect = state.uri.queryParameters['redirect'];

        return buildCustomTransitionPage(LoginPage(redirect : redirect));
      },
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(RegisterPage()),
    ),
    GoRoute(
      path: '/cart',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(CartPage()),
    ),
    GoRoute(
      path: '/order',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(OrderPage()),
    ),
    GoRoute(
      path: '/findAccount',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(findAccountPage()),
    ),
    GoRoute(
      path: '/findId',
      pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(findIdPage()),
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
  DateTime? lastBackPressTime;

  void showBottomSheet(Widget widget) {
    showModalBottomSheet(
      context: context,
      builder: (context) => widget,
    );
  }

  Future<bool> onWillPop(){
    DateTime now = DateTime.now();
    if(lastBackPressTime == null || now.difference(lastBackPressTime!) > Duration(seconds: 2)){
      lastBackPressTime = now;
      final msg = "'뒤로' 버튼을 한 번 더 누르면 종료됩니다.";
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if(await onWillPop()) SystemNavigator.pop();
      },
      child: Scaffold(
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
