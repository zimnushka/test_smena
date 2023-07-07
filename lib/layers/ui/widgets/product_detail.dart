import 'package:flutter/material.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/styles/text.dart';
import 'package:test_smena/layers/ui/widgets/add_product_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(this.item, {super.key});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.imageUrl),
            const SizedBox(height: 24),
            AppText(item.name, weight: FontWeight.w700),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTitleText('${item.cost} ₽', weight: FontWeight.w800),
                  AddProductButton(
                    item,
                    text: AppLocalizations.of(context)!.want,
                    size: const Size(120, 50),
                  ),
                ],
              ),
            ),
            AppSmallText(
              item.description,
              weight: FontWeight.w600,
              color: const Color.fromRGBO(116, 124, 138, 1),
            ),
          ],
        ),
      ),
    );
  }
}
