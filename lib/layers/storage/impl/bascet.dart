import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_smena/layers/models/bascet_product.dart';
import 'package:test_smena/layers/storage/storage.dart';

class BascetStorage implements AppStorage<BascetProduct> {
  @override
  String get storageKey => 'BascetStorageKey';

  Future<BascetProduct?> read(int id) async {
    final box = await Hive.openBox<BascetProduct>(storageKey);
    return box.get(id);
  }

  Future<List<BascetProduct>> readAll() async {
    final box = await Hive.openBox<BascetProduct>(storageKey);
    return box.values.toList();
  }

  Future<void> write(int id, BascetProduct item) async {
    final box = await Hive.openBox<BascetProduct>(storageKey);
    await box.put(id, item);
  }

  Future<void> delete(int id) async {
    final box = await Hive.openBox<BascetProduct>(storageKey);
    await box.delete(id);
  }

  Future<void> deleteAll() async {
    final box = await Hive.openBox<BascetProduct>(storageKey);
    await box.deleteFromDisk();
  }
}
