import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_smena/app/app_provider.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/bascet/buscet_cubit.dart';
import 'package:test_smena/layers/ui/widgets/landing.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appProvider),
        BlocProvider(create: (context) => BascetProvider()),
      ],
      child: BlocBuilder<AppProvider, AppProviderState>(
          bloc: appProvider,
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: state.config.isDebug,
              theme: state.theme,
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
                return Landing(child ?? const SizedBox());
              },
            );
          }),
    );
  }
}
