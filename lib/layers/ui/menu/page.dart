import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/menu/menu_bloc.dart';
import 'package:test_smena/layers/bloc/menu/menu_event.dart';
import 'package:test_smena/layers/bloc/menu/menu_state.dart';
import 'package:test_smena/layers/styles/text.dart';
import 'package:test_smena/layers/ui/menu/card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

MenuBloc _bloc(BuildContext context) => BlocProvider.of(context);

class MenuRoute implements AppPage {
  @override
  String get name => 'menu';

  @override
  Map<String, String>? get params => null;

  @override
  Map<String, String>? get queryParams => null;
}

class MenuPage extends StatefulWidget {
  static AppPage route() => MenuRoute();

  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc menuBloc = MenuBloc();

  @override
  void initState() {
    menuBloc.add(const OnLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: menuBloc,
      child: BlocBuilder<MenuBloc, MenuState>(
        bloc: menuBloc,
        builder: (context, state) {
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
        padding: const EdgeInsets.only(left: 20, right: 19),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 16),
                child: AppTitleText(AppLocalizations.of(context)!.categories),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: state.categories
                  .map(
                    (item) => MenuCard(
                      item,
                      onTap: () => _bloc(context).add(
                        OnTapCategory(item.id),
                      ),
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
