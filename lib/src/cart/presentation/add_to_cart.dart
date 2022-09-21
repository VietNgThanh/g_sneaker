import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_controller.dart';
import '../../products/domain/product.dart';

import '../../constants/themes.dart';
import '../data/local_cart_repository.dart';

class AddToCart extends ConsumerWidget {
  const AddToCart({
    super.key,
    required this.productId,
  });

  final ProductId productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdded = ref.watch(itemIsAddedToCartProvider(productId));
    return isAdded
        ? const CircleAvatar(
            backgroundColor: yellow,
            foregroundColor: black,
            child: Icon(Icons.check),
          )
        : ElevatedButton(
            onPressed: () async {
              await ref
                  .read(cartControllerProvider.notifier)
                  .addToCart(productId);
            },
            style: buttonStyle,
            child: const Text(
              'ADD TO CART',
              style: buttonText,
            ),
          );
  }
}
