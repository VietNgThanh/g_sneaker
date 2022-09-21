import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local_cart_repository.dart';
import '../domain/item.dart';
import '../domain/mutable_cart.dart';
import '../../products/domain/product.dart';

class CartController extends StateNotifier<AsyncValue<void>> {
  CartController({
    required this.localCartRepository,
  }) : super(const AsyncData(null));

  final LocalCartRepository localCartRepository;

  Future<void> addToCart(ProductId productId) async {
    state = const AsyncLoading();
    final cart = await localCartRepository.fetchCart();
    final updatedCart = cart.addItem(Item(productId: productId, quantity: 1));
    state =
        await AsyncValue.guard(() => localCartRepository.setCart(updatedCart));
  }

  Future<void> updateItemQuantity(ProductId productID, int quantity) async {
    state = const AsyncLoading();
    if (quantity == 0) {
      await removeItemById(productID);
      return;
    }
    final cart = await localCartRepository.fetchCart();
    final updatedItem = Item(productId: productID, quantity: quantity);
    final updatedCart = cart.setItem(updatedItem);
    await AsyncValue.guard(() => localCartRepository.setCart(updatedCart));
    state =
        await AsyncValue.guard(() => localCartRepository.setCart(updatedCart));
  }

  Future<void> removeItemById(ProductId productID) async {
    state = const AsyncLoading();
    final cart = await localCartRepository.fetchCart();
    final updatedCart = cart.removeItemById(productID);

    state =
        await AsyncValue.guard(() => localCartRepository.setCart(updatedCart));
  }
}

final cartControllerProvider =
    StateNotifierProvider<CartController, AsyncValue<void>>((ref) {
  return CartController(
    localCartRepository: ref.watch(localCartRepositoryProvider),
  );
});
