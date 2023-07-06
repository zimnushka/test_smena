import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_smena/app/app_provider.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/ui/widgets/bottom_nav_bar.dart';

class TestSmenaApp extends StatefulWidget {
  const TestSmenaApp({super.key});

  @override
  State<TestSmenaApp> createState() => _TestSmenaAppState();
}

class _TestSmenaAppState extends State<TestSmenaApp> {
  final appProvider = AppProvider();

  @override
  void initState() {
    AppRouter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppProvider, AppProviderState>(
        bloc: appProvider,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Test smena app',
            routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
            routeInformationParser: AppRouter.goRouter.routeInformationParser,
            routerDelegate: AppRouter.goRouter.routerDelegate,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ru'),
            ],
            builder: (context, child) {
              return Overlay(initialEntries: [
                OverlayEntry(
                  builder: (context) {
                    return Scaffold(
                      body: child ?? const SizedBox(),
                      bottomNavigationBar: const AppBottomNavBar(),
                    );
                  },
                )
              ]);
            },
          );
        });
  }
}
