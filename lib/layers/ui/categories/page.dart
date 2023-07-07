import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/categories/category_bloc.dart';
import 'package:test_smena/layers/bloc/categories/category_event.dart';
import 'package:test_smena/layers/bloc/categories/category_state.dart';
import 'package:test_smena/layers/styles/text.dart';
import 'package:test_smena/layers/ui/categories/card.dart';

CategoryBloc _bloc(BuildContext context) => BlocProvider.of(context);

class CategoryRoute implements AppPage {
  final int categoryId;

  const CategoryRoute(this.categoryId);

  @override
  String get name => 'category';

  @override
  Map<String, String> get params => {'categoryId': categoryId.toString()};

  @override
  Map<String, String>? get queryParams => null;
}

class CategoryPage extends StatefulWidget {
  static AppPage route(int id) => CategoryRoute(id);

  const CategoryPage(this.id, {super.key});
  final int id;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryBloc menuBloc = CategoryBloc(widget.id);

  @override
  void initState() {
    menuBloc.add(OnLoad(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: menuBloc,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        bloc: menuBloc,
        builder: (context, state) {
          // TODO(kirill): error state
          if (state is LoadedState) {
            return _Body(state: state);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final LoadedState state;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async => _bloc(context).add(const OnRefresh()),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 9),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 16),
                child: Row(
                  children: [
                    const BackButton(),
                    Expanded(child: AppTitleText(state.category.categoryName)),
                  ],
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.3,
              children: state.category.products
                  .map(
                    (item) => ProductCard(
                      item,
                      onTap: () => _bloc(context).add(OnTapProduct(item)),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
