import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';

import 'src/cart/data/local_cart_repository.dart';
import 'src/cart/data/sembast_cart_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * Local cart repository
  final localCartRepository = await SembastCartRepository.makeDefault();
  // * Create ProviderContainer with any required overrides
  final container = ProviderContainer(overrides: [
    localCartRepositoryProvider.overrideWithProvider(
      Provider<LocalCartRepository>((ref) {
        ref.onDispose(localCartRepository.dispose);
        return localCartRepository;
      }),
    ),
  ]);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
