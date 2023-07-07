import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  const AppTitleText(this.text, {super.key, this.color, this.weight, this.maxLines});
  final String text;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines, style: TextStyle(fontSize: 20, fontWeight: weight, color: color));
  }
}

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key, this.color, this.weight, this.maxLines});
  final String text;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines, style: TextStyle(fontSize: 14, fontWeight: weight, color: color));
  }
}

class AppSmallText extends StatelessWidget {
  const AppSmallText(this.text, {super.key, this.color, this.weight, this.maxLines});
  final String text;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines, style: TextStyle(fontSize: 12, fontWeight: weight, color: color));
  }
}
