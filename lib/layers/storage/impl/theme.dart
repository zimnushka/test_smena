import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_smena/layers/storage/storage.dart';

class ThemeStorage implements AppStorage<bool> {
  @override
  String get storageKey => 'ThemeStorageKey';

  Future<bool?> get() async {
    final pref = await SharedPreferences.getInstance();
    try {
      return (pref.getBool(storageKey)) ?? true;
    } catch (e) {
      return null;
    }
  }

  Future<bool> save(bool isLightTheme) async {
    final pref = await SharedPreferences.getInstance();
    try {
      return await pref.setBool(storageKey, isLightTheme);
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete() async {
    final pref = await SharedPreferences.getInstance();
    try {
      return await pref.remove(storageKey);
    } catch (e) {
      return false;
    }
  }
}
