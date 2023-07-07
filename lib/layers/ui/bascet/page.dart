import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_smena/app/router.dart';
import 'package:test_smena/layers/bloc/bascet/buscet_cubit.dart';
import 'package:test_smena/layers/models/bascet_product.dart';
import 'package:test_smena/layers/styles/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_smena/layers/ui/bascet/card.dart';
import 'package:test_smena/layers/ui/widgets/product_detail.dart';

BascetProvider _bloc(BuildContext context) => BlocProvider.of(context);

class BuscetRoute implements AppPage {
  @override
  String get name => 'buscet';

  @override
  Map<String, String>? get params => null;

  @override
  Map<String, String>? get queryParams => null;
}

class BuscetPage extends StatelessWidget {
  const BuscetPage({super.key});

  static AppPage route() => BuscetRoute();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BascetProvider, BascetState>(builder: (context, state) {
      final List<BascetProduct> products = state.products.entries.map((e) => e.value).toList();
      return RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: () => _bloc(context).load(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 16),
                  child: Row(
                    children: [
                      const BackButton(),
                      Expanded(child: AppTitleText(AppLocalizations.of(context)!.buscet)),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BascetProductCard(products[index], onTap: () async {
                      await showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        isDismissible: true,
                        context: AppRouter.context,
                        builder: (context) {
                          return ProductDetail(products[index].toProduct());
                        },
                      );
                    });
                  },
                  childCount: state.products.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
