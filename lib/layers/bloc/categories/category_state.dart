import 'package:test_smena/layers/bloc/app_state.dart';
import 'package:test_smena/layers/models/schemes.dart';

abstract class CategoryState implements AppState {}

class LoadingState implements CategoryState {
  final int id;

  const LoadingState(this.id);
}

class LoadedState implements CategoryState {
  final int id;
  final Category category;

  const LoadedState({
    required this.id,
    required this.category,
  });
}

class ErrorState implements CategoryState {
  final int id;
  final String message;

  const ErrorState(this.id, this.message);
}
