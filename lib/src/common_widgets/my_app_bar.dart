import 'package:flutter/material.dart';

import '../constants/themes.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/nike.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: appBartitle,
              ),
              child,
            ],
          )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}
