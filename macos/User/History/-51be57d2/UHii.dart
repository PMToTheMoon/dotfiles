import 'package:flutter/material.dart' hide Colors;

/// This class is intended to be used to construct theme data.
/// Do NOT use in widget tree access colors by using Theme.of(context) instead.
class Colors {
  static const lightGray = Color.fromARGB(255, 238, 238, 238);
  static const mediumGray = Color(0xffD6D6D6);
  static const darkGray = Color.fromARGB(255, 133, 133, 133);
  static const red = Color(0xffB70604);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const blue = Color(0xff337ab7);
}
