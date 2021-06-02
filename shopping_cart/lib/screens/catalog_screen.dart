import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/catalog/catalog_bloc.dart';
import 'package:shopping_cart/widgets/my_appbar.dart';
import 'package:shopping_cart/widgets/my_list_item.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12.0,
            ),
          ),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CatalogLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => MyListItem(
                      state.catalog.getByPosition(index),
                    ),
                  ),
                );
              }
              return const Text('Something went wrong!');
            },
          )
        ],
      ),
    );
  }
}
