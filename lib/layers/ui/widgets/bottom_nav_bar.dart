import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/layers/bloc/bascet/buscet_cubit.dart';
import 'package:test_smena/layers/styles/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({required this.selectedIndex, required this.onTap, super.key});
  final int selectedIndex;
  final Function(int) onTap;

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
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap,
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
}
