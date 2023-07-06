import 'package:flutter/material.dart';
import 'package:test_smena/app/router.dart';

class BuscetRoute implements AppPage {
  @override
  String get name => 'buscet';

  @override
  Map<String, String>? get params => null;

  @override
  Map<String, String>? get queryParams => null;
}

class BuscetPage extends StatelessWidget {
  const BuscetPage({super.key});

  static AppPage route() => BuscetRoute();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
