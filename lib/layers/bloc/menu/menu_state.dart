import 'package:test_smena/layers/bloc/app_state.dart';
import 'package:test_smena/layers/models/schemes.dart';

abstract class MenuState implements AppState {}

class LoadingState implements MenuState {}

class LoadedState implements MenuState {
  final List<Category> categories;

  const LoadedState(this.categories);
}
