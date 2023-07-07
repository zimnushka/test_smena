import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_smena/app/configs.dart';
import 'package:test_smena/layers/storage/storage.dart';

class ConfigStorage implements AppStorage<AppConfig> {
  @override
  String get storageKey => 'configStorageKey';

  Future<AppConfig?> read() async {
    final box = await Hive.openBox<AppConfig>(storageKey);
    return box.get(storageKey);
  }

  Future<void> write(AppConfig item) async {
    final box = await Hive.openBox<AppConfig>(storageKey);
    await box.put(storageKey, item);
  }

  Future<bool> delete() async {
    final box = await Hive.openBox<AppConfig>(storageKey);
    await box.deleteFromDisk();
    return true;
  }
}
