import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/items.dart';

class Cart extends Equatable {
  final List<Item> items;

  const Cart({this.items = const <Item>[]});

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  @override
  List<Object?> get props => [items];
}
