import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading = const Center(child: CircularProgressIndicator()),
  }) : super(key: key);

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => loading,
    );
  }
}
