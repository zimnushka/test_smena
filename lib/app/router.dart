import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_smena/layers/ui/bascet/page.dart';
import 'package:test_smena/layers/ui/categories/page.dart';
import 'package:test_smena/layers/ui/menu/page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static late GoRouter _router;

  static GoRouter get goRouter => _router;

  static void init() {
    _router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          name: MenuPage.route().name,
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(child: MenuPage()),
        ),
        GoRoute(
          name: BuscetPage.route().name,
          path: '/buscet',
          pageBuilder: (context, state) => const MaterialPage(child: BuscetPage()),
        ),
        GoRoute(
          name: CategoryPage.route(0).name,
          path: '/category/:categoryId',
          pageBuilder: (context, state) => MaterialPage(
              child: CategoryPage(
            int.parse(state.pathParameters['categoryId']!),
          )),
        ),
      ],
    );
  }

  static Future<void> goTo(AppPage page) async {
    await _router.pushNamed(
      page.name,
      pathParameters: page.params ?? {},
      queryParameters: page.queryParams ?? {},
    );
  }

  static Future<void> pop() async {
    if (_router.canPop()) {
      _router.pop();
    }
  }

  // static Future<void> dialog(WidgetBuilder builder) async {
  //   final provider = context.read<AppProvider>();
  //   await showDialog(
  //       context: navigatorKey.currentContext!,
  //       builder: (context) {
  //         return Theme(
  //           data: provider.state.theme,
  //           child: builder(context),
  //         );
  //       });
  //   return;
  // }

  static BuildContext get context => navigatorKey.currentContext!;
}

abstract class AppPage {
  String get name;
  Map<String, String>? get params;
  Map<String, String>? get queryParams;
}
