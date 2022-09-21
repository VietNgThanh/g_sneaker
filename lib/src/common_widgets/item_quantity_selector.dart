import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/themes.dart';

class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
    required this.onDelete,
  });

  final int quantity;
  final ValueChanged<int> onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    const buttonPadding = kIsWeb ? EdgeInsets.all(20.0) : EdgeInsets.all(12.0);
    const deleteButtonPadding =
        kIsWeb ? EdgeInsets.all(16.0) : EdgeInsets.all(8.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _CartButton(
              onPressed:
                  quantity > 1 ? () => onChanged.call(quantity - 1) : onDelete,
              color: const Color(0xffeeeeee),
              padding: buttonPadding,
              child: Image.asset(
                'assets/images/minus.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 30.0,
              child: Text(
                '$quantity',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            _CartButton(
              onPressed: () => onChanged.call(quantity + 1),
              color: const Color(0xffeeeeee),
              padding: buttonPadding,
              child: Image.asset(
                'assets/images/plus.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        _CartButton(
          onPressed: onDelete,
          color: yellow,
          padding: deleteButtonPadding,
          child: Image.asset(
            'assets/images/trash.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton({
    required this.color,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.all(6.0),
  });

  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        color: color,
        textColor: Colors.white,
        padding: padding,
        shape: const CircleBorder(),
        child: child,
      ),
    );
  }
}
