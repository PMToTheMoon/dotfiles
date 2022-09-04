import 'package:flutter/material.dart';

import 'package:common/theme/colors.dart' as ub;
import 'package:common/common.dart' as ub;

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    overlayColor: ub.Colors.white.msp,
    backgroundColor: ub.Colors.lightGray.msp,
    foregroundColor: ub.Colors.black.msp,
    side: const BorderSide(color: ub.Colors.mediumGray).msp,
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    overlayColor: ub.Colors.red.msp,
    backgroundColor: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.disabled)) return ub.Colors.mediumGray;
      return ub.Colors.black;
    }),
    foregroundColor: ub.Colors.white.msp,
    textStyle: const TextStyle(fontWeight: FontWeight.bold).msp,
  ),
);

final radioThemeData = RadioThemeData(
  visualDensity: VisualDensity.compact,
);
