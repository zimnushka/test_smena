import 'package:flutter/material.dart';
import 'package:test_smena/app/router.dart';

class CategoryRoute implements AppPage {
  final int categoryId;

  const CategoryRoute(this.categoryId);

  @override
  String get name => 'category';

  @override
  Map<String, String> get params => {'categoryId': categoryId.toString()};

  @override
  Map<String, String>? get queryParams => null;
}

class CategoryPage extends StatelessWidget {
  static AppPage route(int id) => CategoryRoute(id);

  const CategoryPage(this.id, {super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
