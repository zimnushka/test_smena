import 'package:flutter/material.dart';
import 'package:test_smena/layers/models/bascet_product.dart';
import 'package:test_smena/layers/styles/text.dart';
import 'package:test_smena/layers/ui/widgets/add_product_button.dart';

class BascetProductCard extends StatelessWidget {
  const BascetProductCard(this.item, {required this.onTap, super.key});
  final BascetProduct item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Image.network(item.imageUrl),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSmallText(
                    item.name,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            '${item.cost} ₽',
                            weight: FontWeight.w800,
                          ),
                          AppSmallText(
                            item.sizes,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      AddProductButton(item.toProduct()),
                      const SizedBox(width: 15),
                    ],
                  ),
                ],
              )),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
