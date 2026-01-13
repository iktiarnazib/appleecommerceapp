import 'package:flutter/cupertino.dart';
import 'package:ncommerce/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    state = {...state, product};
    debugPrint('Cart size: ${state.length}');
  }

  void removeProduct(Product product) {
    state = state.where((e) => e.id != product.id).toSet();
    debugPrint('Cart size: ${state.length}');
  }
}

//Dependant provider of another provider

@riverpod
int cartTotal(ref) {
  final cartProduct = ref.watch(cartProvider);

  int productTotal = 0;

  for (Product product in cartProduct) {
    productTotal += product.price;
  }

  return productTotal;
}
