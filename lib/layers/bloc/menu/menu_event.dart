import 'package:test_smena/layers/bloc/app_event.dart';

class MenuEvent implements AppEvent {}

class OnLoad implements MenuEvent {
  const OnLoad();
}

class OnRefresh implements MenuEvent {
  const OnRefresh();
}

class OnTapCategory implements MenuEvent {
  final int id;

  const OnTapCategory(this.id);
}
