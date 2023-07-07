import 'package:test_smena/layers/bloc/app_event.dart';
import 'package:test_smena/layers/models/schemes.dart';

class CategoryEvent implements AppEvent {}

class OnLoad implements CategoryEvent {
  final int id;
  const OnLoad(this.id);
}

class OnRefresh implements CategoryEvent {
  const OnRefresh();
}

class OnTapProduct implements CategoryEvent {
  final Product item;

  const OnTapProduct(this.item);
}
