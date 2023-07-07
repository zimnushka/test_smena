import 'package:test_smena/layers/bloc/app_event.dart';

class CategoryEvent implements AppEvent {}

class OnLoad implements CategoryEvent {
  final int id;
  const OnLoad(this.id);
}

class OnRefresh implements CategoryEvent {
  const OnRefresh();
}

class OnTapProduct implements CategoryEvent {
  final int id;

  const OnTapProduct(this.id);
}

class OnTapPlusProduct implements CategoryEvent {
  final int id;

  const OnTapPlusProduct(this.id);
}

class OnTapMinusProduct implements CategoryEvent {
  final int id;

  const OnTapMinusProduct(this.id);
}
