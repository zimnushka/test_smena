import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/menu/menu_event.dart';
import 'package:test_smena/layers/bloc/menu/menu_state.dart';
import 'package:test_smena/layers/repositories/impl/catigories.dart';
import 'package:test_smena/layers/ui/categories/page.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final _categoriesRepository = CategoriesRepository();

  MenuBloc() : super(LoadingState()) {
    on<OnLoad>(_onLoad);
    on<OnRefresh>(_onRefresh);
    on<OnTapCategory>(_onTapCategory);
  }

  Future<void> _onLoad(OnLoad event, Emitter emit) async {
    final categoriesResponce = await _categoriesRepository.getCategories();
    final categories = categoriesResponce.data ?? [];
    // TODO(kirill): add snckbar if list is empty
    emit(LoadedState(categories));
  }

  Future<void> _onRefresh(OnRefresh event, Emitter emit) async {
    final currentState = state;
    emit(LoadingState());
    try {
      final categories = (await _categoriesRepository.getCategories()).data ?? [];
      // TODO(kirill): add snckbar if list is empty
      emit(LoadedState(categories));
    } catch (e) {
      // Если произойдет сбой, чтобы не было бесконечной загрузки, отображаю предыдущее состояние
      emit(currentState);
    }
  }

  Future<void> _onTapCategory(OnTapCategory event, Emitter emit) async {
    await AppRouter.goTo(CategoryPage.route(event.id));
  }
}
