import 'package:hive/hive.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/storage/storage.dart';

part 'bascet_product.g.dart';

@HiveType(typeId: AppStorage.bascetHiveId)
class BascetProduct extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int categoryId;

  @HiveField(2)
  final int cost;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String imageUrl;

  @HiveField(5)
  final String sizes;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final int count;

  BascetProduct({
    required this.id,
    required this.categoryId,
    required this.cost,
    required this.count,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.sizes,
  });

  factory BascetProduct.fromProduct(int count, Product item) {
    return BascetProduct(
      id: item.id,
      categoryId: item.categoryId,
      cost: item.cost,
      count: count,
      description: item.description,
      imageUrl: item.imageUrl,
      name: item.name,
      sizes: item.sizes,
    );
  }
}
