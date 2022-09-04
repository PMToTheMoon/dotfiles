import 'package:flutter/material.dart';

/// DO NOT use inside widget tree directly. Use flutter theme system instead
abstract class TbtAppColors {
  TbtAppColors._();

  static const brandBlue = Color(0xff2040DA);

  static final highlight = Colors.white.withOpacity(.42);

  static const blue = Color(0xff1A70F0);
  static const blueHover = Color(0xff0C54C0);
  static const blueContainer = Color(0xffEBF3FE);

  static const orange = Color(0xffFD8D35);
  static const orangeHover = Color(0xffED6A03);
  static const orangeContainer = Color(0xffFFF1E7);

  static const text = Color(0xff292E45);
  static const subtitle = Color(0xff54586A);
  static const label = Color(0xff9496A1);
  static const disabled = Color(0xffBEC0C6);
  static const divider = Color(0xffD9DADE);

  @Deprecated('use backgroundBlue instead')
  static const backgroundGray = Color(0xffF6F6F7);
  static const backgroundBlue = Color(0xffF8F9FC);
  static const white = Colors.white;

  static const error = Color(0xffE00D33);
  static const errorContainer = Color(0xffFDEEEE);

  static const warning = Color(0xffF2994A);
  static const warningContainer = Color(0xffFAEDCD);

  static const success = Color(0xff45C57A);
  static const successContainer = Color(0xffEAF9F4);

  static const iconDarkBlue = Color(0xff2F80ED);
  static const iconMediumBlue = Color(0xff2D9CDB);
  static const iconLightBlue = Color(0xff56CCF2);
  static const iconDarkPurple = Color(0xff9B51E0);
  static const iconMediumPurple = Color(0xffBB6BD9);

  static const outline = label;
  static const shadow = Color.fromARGB(225, 0, 0, 0);
}

/// DO NOT use inside widget tree directly. Use flutter theme system instead
@Deprecated('use TbtAppColors instead')
abstract class AppColors {
  static const blueAccent = Color(0xff0C2CAE);
  static const blue = Color(0xff2040DA);
  static const lightBlue = Color(0xff1A70F0);
  static const blueHover = Color(0x252040DA);
  static const backgroundBlue = Color(0xffEAF2FD);

  static const orangeAccent = Color(0xffED6A03);
  static const orange = Color(0xffFD8D35);
  static const orangeHover = Color(0x25FD8D35);
  static const lightOrange = Color(0xffFFF4EB);
  static const orangDisabled = Color(0xffF0B88C);

  static const disabled = lighterGray;
  static const onDisabled = darkGray;

  static const black = Color(0xff000000);
  static const white = Color(0xffFFFFFF);
  static const background = Color(0xffF0F2FA);

  static const yellow = Color(0xffF2C94C);
  static const purple = Color(0xff9B51E0);
  static const green = Color(0xff6FCF97);
  static const red = Color(0xffE00D33);

  static const shadow = Color.fromARGB(225, 0, 0, 0);
  static const outline = Color(0xffD9D9D9);

  /// We need a better system
  /// Colors.gray[1] ?
  /// Colors.gray10 ?
  /// named colors (outlineGray?, wineRed?)
  static const darkestGray = Color(0xff292E45);
  static const darkerGray = Color(0xff54586A);
  static const darkGray = Color(0xffA1A0A7);
  static const gray = Color(0xffBEC0C6);
  static const lightGray = Color(0xffE0E0E0);
  static const lighterGray = Color(0xffF6F6F8);
}
