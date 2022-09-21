import '../../products/domain/product.dart';

class Item {
  const Item({
    required this.productId,
    required this.quantity,
  });
  final ProductId productId;
  final int quantity;
}
