import 'package:flutter/material.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/styles/text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.item, {required this.onTap, super.key});
  final Product item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(item.imageUrl),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 45, 0),
                child: AppSmallText(
                  item.name,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
