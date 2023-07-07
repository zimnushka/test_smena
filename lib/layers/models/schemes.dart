// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'schemes.freezed.dart';
part 'schemes.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Category with _$Category {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Category({
    required final int id,
    required final String categoryName,
    required final String imageUrl,
    required final List<Product> products,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Product with _$Product {
  factory Product({
    required final int id,
    required final int categoryId,
    required final int cost,
    required final String name,
    @JsonKey(name: 'image_url') required final String imageUrl,
    required final String sizes,
    required final String description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
