import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/product.dart';
import 'shoes.dart';

class ProductsRepository {
  final _products = _getProductsFromJson('./shoes.json');

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(ProductId productId) {
    try {
      return _products.firstWhere(
        (product) => product.id == productId,
      );
    } catch (e) {
      return null;
    }
  }
}

List<Product> _getProductsFromJson(String fileName) {
  return shoesList['shoes']!
      .map((productMap) => Product.fromMap(productMap))
      .toList();
}

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepository();
});

final productsListProvider = Provider<List<Product>>((ref) {
  return ref.watch(productsRepositoryProvider).getProductsList();
});

final productProvider = Provider.family<Product?, ProductId>(
  (ref, id) {
    final productsRepository = ref.watch(productsRepositoryProvider);
    return productsRepository.getProduct(id);
  },
);
