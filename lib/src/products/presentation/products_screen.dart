import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/products_repository.dart';
import 'product_card.dart';

import '../../cart/presentation/cart_icon_button.dart';
import '../../common_widgets/background_painter.dart';
import '../../common_widgets/my_app_bar.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var paddingWidth = size.width *
        (size.width > 1400
            ? .05
            : size.width > 1250
                ? .2
                : size.width > 1000
                    ? .18
                    : size.width > 750
                        ? .05
                        : size.width > 500
                            ? .2
                            : .1);
    final products = ref.watch(productsRepositoryProvider).getProductsList();
    return SafeArea(
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const MyAppBar(
            title: 'Our Products',
            child: CartIconButton(),
          ),
          // body: Padding(
          //   padding: screenPadding,
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       return SlideInUp(
          //         from: 200,
          //         child: ProductCard(product: products[index]),
          //       );
          //     },
          //   ),
          // ),
          body: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: paddingWidth),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              childAspectRatio: 7 / 16,
              // mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ),
    );
  }
}
