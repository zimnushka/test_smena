import 'package:flutter/material.dart';
import 'package:test_smena/app/router.dart';

class MenuRoute implements AppPage {
  @override
  String get name => 'menu';

  @override
  Map<String, String>? get params => null;

  @override
  Map<String, String>? get queryParams => null;
}

class MenuPage extends StatelessWidget {
  static AppPage route() => MenuRoute();

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
