import 'dart:ui';

abstract class TbtColors {
  brandBlue = 2040DA;
  blue = 1A70F0;
  blueHover = 0C54C0;
  blueBackground = EBF3FE;

  orange = FD8D35;
  orangeHover = ED6A03;
  orangeBackground = FFF1E7;
}

/// DO NOT use inside widget tree directly. Use flutter theme system instead
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
