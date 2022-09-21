import 'dart:math';

import 'package:flutter/material.dart';
import '../../cart/presentation/add_to_cart.dart';
import '../../constants/themes.dart';
import '../domain/product.dart';
import '../../utils/hex_color.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 4 / 5,
          child: Container(
            padding: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: HexColor.fromHex(product.color),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Transform.rotate(
              angle: -pi / 8,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: black,
          ),
        ),
        // const SizedBox(height: 24.0),
        Text(
          product.description,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 5,
          style: const TextStyle(
            color: gray,
            height: 2,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: title,
            ),
            AddToCart(productId: product.id),
          ],
        ),
        // const SizedBox(height: 12.0),
      ],
    );
  }
}
