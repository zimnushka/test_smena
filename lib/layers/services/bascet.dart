import 'package:test_smena/layers/models/bascet_product.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/storage/impl/bascet.dart';

class BascetService {
  final storage = BascetStorage();

  Future<Map<int, BascetProduct>> getBuscetAsMap() async {
    final items = await storage.readAll();
    final mapEntries = items.map((e) => MapEntry(e.id, e));
    return Map.fromEntries(mapEntries);
  }

  Future<List<BascetProduct>> getBuscetAsList() async {
    final items = await storage.readAll();

    return items.toList();
  }

  Future<void> plusProduct(Product item) async {
    final products = await getBuscetAsMap();
    final count = products[item.id]?.count ?? 0;

    await storage.write(item.id, BascetProduct.fromProduct(count + 1, item));
  }

  Future<void> minusProduct(Product item) async {
    final bascetProduct = (await getBuscetAsMap())[item.id];
    if (bascetProduct != null) {
      final count = bascetProduct.count - 1;

      if (count <= 0) {
        await storage.delete(bascetProduct.id);
      } else {
        await storage.write(bascetProduct.id, BascetProduct.fromProduct(count, item));
      }
    }
  }
}
