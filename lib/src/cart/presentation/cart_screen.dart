import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local_cart_repository.dart';
import '../domain/cart.dart';
import '../../common_widgets/async_value_widget.dart';
import '../../common_widgets/background_painter.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../constants/themes.dart';

import 'cart_item_card.dart';

class Cartscreen extends ConsumerWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartValue = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    return SafeArea(
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: MyAppBar(
            title: 'Your cart',
            child: Text(
              '\$${cartTotal.toStringAsFixed(2)}',
              style: appBartitle,
            ),
          ),
          body: AsyncValueWidget(
            value: cartValue,
            data: (cart) {
              final items = cart.toItemsList();
              var size = MediaQuery.of(context).size;
              var paddingWidth = size.width > 800 ? size.width * .2 : 0.0;
              return items.isEmpty
                  ? const Padding(
                      padding: screenPadding,
                      child: Text(
                        'Your cart is empty.',
                        style: TextStyle(
                          color: gray,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: screenPadding,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        const initDelay = 300;
                        return FadeIn(
                          delay:
                              Duration(milliseconds: 400 + initDelay * index),
                          child: SlideInUp(
                            delay:
                                Duration(milliseconds: 400 + initDelay * index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddingWidth),
                              child: CartItemCard(item: items[index]),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
