import '../../products/domain/product.dart';
import 'cart.dart';
import 'item.dart';

extension MutableCart on Cart {
  Cart setItem(Item item) {
    final copy = Map<ProductId, int>.from(items);
    copy[item.productId] = item.quantity;
    return Cart(copy);
  }

  Cart addItem(Item item) {
    final copy = Map<ProductId, int>.from(items);
    copy.update(
      item.productId,
      (value) => item.quantity + value,
      ifAbsent: () => item.quantity,
    );
    return Cart(copy);
  }

  Cart addItems(List<Item> itemsToAdd) {
    final copy = Map<ProductId, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.productId,
        (value) => item.quantity + value,
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy);
  }

  Cart removeItemById(ProductId productId) {
    final copy = Map<ProductId, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }
}
