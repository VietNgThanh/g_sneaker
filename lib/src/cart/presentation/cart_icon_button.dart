import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_sneaker/src/cart/data/local_cart_repository.dart';
import 'package:g_sneaker/src/constants/themes.dart';

import 'cart_screen.dart';

class CartIconButton extends ConsumerWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref.watch(cartItemsCountProvider);
    return Stack(
      children: [
        Center(
          child: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cartscreen(),
              ),
            ),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
        if (cartItemCount > 0)
          Positioned(
            top: 4.0,
            right: 4.0,
            child: CartIconBadge(
              itemsCount: cartItemCount,
            ),
          ),
      ],
    );
  }
}

class CartIconBadge extends StatelessWidget {
  const CartIconBadge({Key? key, required this.itemsCount}) : super(key: key);
  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16.0,
      height: 16.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: yellow,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemsCount',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
