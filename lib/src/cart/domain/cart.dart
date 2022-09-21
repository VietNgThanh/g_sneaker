// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:g_sneaker/src/products/domain/product.dart';

import 'item.dart';

class Cart {
  const Cart([this.items = const {}]);

  final Map<ProductId, int> items;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<ProductId, int>.from((map['items'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        productId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
