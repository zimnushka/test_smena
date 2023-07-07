import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/layers/bloc/categories/category_event.dart';
import 'package:test_smena/layers/bloc/categories/category_state.dart';
import 'package:test_smena/layers/repositories/impl/catigories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final _categoriesRepository = CategoriesRepository();

  CategoryBloc(int id) : super(LoadingState(id)) {
    on<OnLoad>(_onLoad);
    on<OnRefresh>(_onRefresh);
    // on<OnTapProduct>(_onTapCategory);
    // on<OnTapPlusProduct>(_onTapCategory);
    // on<OnTapMinusProduct>(_onTapCategory);
  }

  Future<void> _onLoad(OnLoad event, Emitter emit) async {
    final categoriesResponce = await _categoriesRepository.getCategoryById(event.id);
    final category = categoriesResponce.data ?? [];
    if (category.isEmpty) {
      // TODO(kirill): add snckbar if list is empty
      // emit(ErrorState(id, message));
      return;
    }

    emit(LoadedState(
      id: event.id,
      category: category.first,
    ));
  }

  Future<void> _onRefresh(OnRefresh event, Emitter emit) async {
    final currentState = state as LoadedState;
    emit(LoadingState(currentState.id));
    try {
      final categoriesResponce = await _categoriesRepository.getCategoryById(currentState.id);
      final category = categoriesResponce.data ?? [];
      if (category.isEmpty) {
        // TODO(kirill): add snckbar if list is empty
        // emit(ErrorState(id, message));
        return;
      }

      emit(LoadedState(
        id: currentState.id,
        category: category.first,
      ));
    } catch (e) {
      // Если произойдет сбой, чтобы не было бесконечной загрузки, отображаю предыдущее состояние
      emit(currentState);
    }
  }
}
