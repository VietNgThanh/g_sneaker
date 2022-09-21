import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local_cart_repository.dart';
import '../domain/item.dart';
import 'cart_controller.dart';
import '../../common_widgets/item_quantity_selector.dart';
import '../../constants/themes.dart';
import '../../products/data/products_repository.dart';

import '../../utils/hex_color.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider(item.productId));
    if (product != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            ZoomIn(
              child: SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex(product.color),
                      ),
                    ),
                    Positioned.fill(
                      // top: 10,
                      child: Transform.rotate(
                        angle: -pi / 6,
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeIn(
                    delay: const Duration(milliseconds: 500),
                    child: SlideInRight(
                      delay: const Duration(milliseconds: 500),
                      child: Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeIn(
                    delay: const Duration(milliseconds: 800),
                    child: SlideInRight(
                      delay: const Duration(milliseconds: 800),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: title,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeIn(
                    delay: const Duration(milliseconds: 1200),
                    child: ItemQuantitySelector(
                      quantity:
                          ref.watch(cartProvider).value!.items[product.id]!,
                      onChanged: (quantity) => ref
                          .read(cartControllerProvider.notifier)
                          .updateItemQuantity(product.id, quantity),
                      onDelete: () => ref
                          .read(cartControllerProvider.notifier)
                          .removeItemById(product.id),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return const Center(
      child: Text('item null'),
    );
  }
}
