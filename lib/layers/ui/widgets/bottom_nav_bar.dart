import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/ui/bascet/page.dart';
import 'package:test_smena/layers/ui/menu/page.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final route = AppRouter.goRouter;
    final String location = route.routerDelegate.currentConfiguration.last.matchedLocation;
    if (location == '/') {
      return 0;
    }
    if (location == '/buscet') {
      return 1;
    }
    return 0;
  }

  void onTap(int value) async {
    switch (value) {
      case 0:
        AppRouter.goTo(MenuPage.route());
      case 1:
        AppRouter.goTo(BuscetPage.route());

      default:
        AppRouter.goTo(MenuPage.route());
    }
    setState(() {});
  }
}
