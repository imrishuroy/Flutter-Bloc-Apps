import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/cart/cart_bloc.dart';
import 'package:shopping_cart/models/items.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return TextButton(
            style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: state.cart.items.contains(item)
                ? null
                : () => context.read<CartBloc>().add(CartItemAdded(item)),
            child: state.cart.items.contains(item)
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
        }
        return const Text('Something went wrong!');
      },
    );
  }
}
