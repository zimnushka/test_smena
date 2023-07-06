import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_smena/app/configs.dart';
import 'package:test_smena/layers/storage/storage.dart';

class ConfigStorage implements AppStorage<AppConfig> {
  @override
  String get storageKey => 'configStorageKey';

  @override
  Future<AppConfig?> get() async {
    final pref = await SharedPreferences.getInstance();
    try {
      final configData = (pref.getString(storageKey)) ?? '';
      final Map<String, dynamic> json = jsonDecode(configData);
      return AppConfig.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> save(AppConfig config) async {
    final pref = await SharedPreferences.getInstance();
    try {
      return await pref.setString(storageKey, jsonEncode(config.toJson()));
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete() async {
    final pref = await SharedPreferences.getInstance();
    try {
      return await pref.remove(storageKey);
    } catch (e) {
      return false;
    }
  }
}
