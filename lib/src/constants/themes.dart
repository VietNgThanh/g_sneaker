import 'package:flutter/material.dart';

const black = Color(0xFF303841);
const white = Color(0xFFFFFFFF);
const gray = Color(0xFF777777);
const yellow = Color(0xFFF6C90E);

const screenPadding = EdgeInsets.symmetric(
  vertical: 12.0,
  horizontal: 24.0,
);

const appBartitle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: black,
);

const title = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: black,
);
const buttonText = TextStyle(
  fontWeight: FontWeight.bold,
  color: black,
);

final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: yellow,
  foregroundColor: black,
  elevation: 0.0,
  maximumSize: const Size(160.0, 60.0),
);
