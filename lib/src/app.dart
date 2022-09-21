import 'package:flutter/material.dart';
import 'products/presentation/products_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      home: const ProductsScreen(),
    );
  }
}
