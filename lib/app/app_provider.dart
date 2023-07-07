// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/configs.dart';
import 'package:test_smena/layers/repositories/repository.dart';
import 'package:test_smena/layers/storage/impl/config.dart';
import 'package:test_smena/layers/storage/impl/theme.dart';
import 'package:test_smena/layers/styles/colors.dart';
import 'package:test_smena/layers/styles/themes.dart';

class AppProviderState {
  final ThemeData theme;
  final AppConfig config;

  const AppProviderState({
    required this.theme,
    required this.config,
  });

  AppProviderState copyWith({
    ThemeData? theme,
    AppConfig? config,
  }) {
    return AppProviderState(
      theme: theme ?? this.theme,
      config: config ?? this.config,
    );
  }
}

class AppProvider extends Cubit<AppProviderState> {
  AppProvider() : super(AppProviderState(theme: lightTheme, config: defaultConfig)) {
    load();
  }

  final _themeStorage = ThemeStorage();
  final _configStorage = ConfigStorage();

  Future<void> load() async {
    final isLightTheme = (await _themeStorage.get()) ?? true;
    final config = (await _configStorage.get()) ?? defaultConfig;

    ApiRepository.setConfig(config);

    final AppProviderState newState = AppProviderState(
      theme: _themeFromBool(isLightTheme),
      config: config,
    );

    emit(newState);
  }

  Future<void> setTheme(bool isLightTheme) async {
    if (await _themeStorage.save(isLightTheme)) {
      emit(state.copyWith(theme: _themeFromBool(isLightTheme)));
    } else {
      // TODO(kirill): snackbar
    }
  }

  ThemeData _themeFromBool(bool isLightTheme) {
    return setPrimaryColor(isLightTheme, AppColors.primary);
  }
}
