import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/layers/bloc/bascet/buscet_cubit.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/styles/text.dart';

BascetProvider _bloc(BuildContext context) => BlocProvider.of(context);

class AddProductButton extends StatefulWidget {
  const AddProductButton(this.product, {this.text, this.size, super.key});
  final Product product;
  final String? text;
  final Size? size;

  @override
  State<AddProductButton> createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  Future<void> plus() async {
    await _bloc(context).plus(widget.product);
  }

  Future<void> minus() async {
    await _bloc(context).minus(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BascetProvider, BascetState>(builder: (context, state) {
      final product = state.products[widget.product.id];
      if (product == null) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: widget.size ?? const Size(85, 36)),
          onPressed: plus,
          child: widget.text != null
              ? AppText(
                  widget.text!,
                  color: Colors.white,
                  weight: FontWeight.w800,
                )
              : const Icon(
                  Icons.add,
                  size: 16,
                ),
        );
      }
      return Container(
        width: 100,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Color.fromRGBO(241, 244, 249, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: minus,
              child: const Icon(
                Icons.remove,
                size: 16,
              ),
            ),
            AppSmallText(product.count.toString()),
            InkWell(
              onTap: plus,
              child: const Icon(
                Icons.add,
                size: 16,
              ),
            ),
          ],
        ),
      );
    });
  }
}
