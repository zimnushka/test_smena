// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/layers/models/bascet_product.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/services/bascet.dart';

class BascetState {
  final List<BascetProduct> products;

  const BascetState({required this.products});
}

class BascetProvider extends Cubit<BascetState> {
  BascetProvider() : super(const BascetState(products: [])) {
    load();
  }

  final BascetService _service = BascetService();

  Future<void> load() async {
    final products = await _service.getBuscetAsList();
    emit(BascetState(products: products));
  }

  Future<void> plus(Product item) async {
    await _service.plusProduct(item);
    await load();
  }

  Future<void> minus(Product item) async {
    await _service.minusProduct(item);
    await load();
  }
}
