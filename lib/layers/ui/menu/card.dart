import 'package:flutter/material.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/styles/text.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(this.item, {required this.onTap, super.key});
  final Category item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 15, 13),
              child: AppText(
                item.categoryName,
                weight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
