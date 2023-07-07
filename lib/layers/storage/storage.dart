import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_smena/app/configs.dart';
import 'package:test_smena/layers/models/bascet_product.dart';

abstract class AppStorage<T> {
  static const int bascetHiveId = 0;
  static const int configHiveId = 1;

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(BascetProductAdapter().typeId)) {
      Hive.registerAdapter(BascetProductAdapter());
    }
    if (!Hive.isAdapterRegistered(AppConfigAdapter().typeId)) {
      Hive.registerAdapter(AppConfigAdapter());
    }
  }

  String get storageKey;
}
