import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/bascet/buscet_cubit.dart';
import 'package:test_smena/layers/styles/icons.dart';
import 'package:test_smena/layers/ui/bascet/page.dart';
import 'package:test_smena/layers/ui/menu/page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final bascetProviderState = context.watch<BascetProvider>().state;
    int sum = 0;
    bascetProviderState.products.forEach((key, value) {
      sum = sum + value.cost * value.count;
    });

    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: AppIcon(
            AppIcons.eat,
            size: 24,
            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          ),
          activeIcon: AppIcon(
            AppIcons.eat,
            size: 24,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: AppLocalizations.of(context)!.eat,
        ),
        BottomNavigationBarItem(
          icon: AppIcon(
            AppIcons.basket,
            size: 24,
            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          ),
          activeIcon: AppIcon(
            AppIcons.basket,
            size: 24,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: sum > 0 ? '$sum ₽' : AppLocalizations.of(context)!.buscet,
        ),
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

  Future<void> onTap(int value) async {
    switch (value) {
      case 0:
        await AppRouter.goTo(MenuPage.route());
      case 1:
        await AppRouter.goTo(BuscetPage.route());

      default:
        await AppRouter.goTo(MenuPage.route());
    }
    setState(() {});
  }
}
