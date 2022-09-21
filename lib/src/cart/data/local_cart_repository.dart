import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_sneaker/src/products/data/products_repository.dart';
import '../../products/domain/product.dart';

import '../domain/cart.dart';

abstract class LocalCartRepository {
  Future<Cart> fetchCart();

  Stream<Cart> watchCart();

  Future<void> setCart(Cart cart);
}

final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
  // * Override this in the main method
  throw UnimplementedError();
});

final cartProvider = StreamProvider.autoDispose<Cart>((ref) {
  return ref.watch(localCartRepositoryProvider).watchCart();
});

final itemIsAddedToCartProvider =
    Provider.family.autoDispose<bool, ProductId>((ref, id) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    return cart.items.containsKey(id);
  }
  return false;
});

final cartItemsCountProvider = Provider.autoDispose<int>((ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
});

final cartTotalProvider = Provider.autoDispose<double>((ref) {
  final cart = ref.watch(cartProvider).value ?? const Cart();
  final productsList = ref.watch(productsListProvider);

  if (cart.items.isEmpty || productsList.isEmpty) {
    return 0.0;
  }

  var total = 0.0;
  cart.items.forEach((productId, quantity) {
    final product =
        productsList.firstWhere((product) => product.id == productId);
    total += product.price * quantity;
  });
  return total;
});
