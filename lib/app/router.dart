import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_smena/layers/ui/menu/page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static late GoRouter _router;

  static GoRouter get goRouter => _router;

  static void init() {
    _router = GoRouter(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          name: MenuPage.route().name,
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(child: MenuPage()),
        ),
      ],
    );
  }

  static Future<void> goTo(AppPage page) async {
    GoRouter.of(context).pushNamed(
      page.name,
      pathParameters: page.params ?? {},
      queryParameters: page.queryParams ?? {},
    );
  }

  static Future<void> pop() async {
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
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
