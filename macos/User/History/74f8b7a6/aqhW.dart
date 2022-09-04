import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return TbtAppColors.disabled;
      }
      return TbtAppColors.orange;
    }),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return TbtAppColors.highlight;
      }
      if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        return TbtAppColors.orangeHover;
      }
      return null;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return TbtAppColors.label;
      }
      return TbtAppColors.white;
    }),
    textStyle: textTheme.labelLarge.msp,
    elevation: 0.0.msp,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ).msp,
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: Colors.transparent.msp,
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return TbtAppColors.orangeHover.withOpacity(.42);
      }
      if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        return TbtAppColors.orangeContainer;
      }
      return Colors.transparent;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return TbtAppColors.disabled;
      }
      if (states.contains(MaterialState.pressed)) {
        return TbtAppColors.orangeHover;
      }
      // if (states.contains(MaterialState.hovered) ||
      //     states.contains(MaterialState.focused)) {
      //   return TbtAppColors.orangeHover;
      // }
      return TbtAppColors.text;
    }),
    textStyle: textTheme.labelLarge.msp,
    elevation: 0.0.msp,
    side: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: TbtAppColors.disabled);
      }
      final borderColor = states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused)
          ? TbtAppColors.orange
          : TbtAppColors.disabled;
      return BorderSide(color: borderColor);
    }),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ).msp,
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    primary: TbtAppColors.text,
  ).copyWith(
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return TbtAppColors.orange.withOpacity(.4);
      }
      if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        return TbtAppColors.orangeContainer;
      }
      return Colors.transparent;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return TbtAppColors.disabled;
      }
      if (states.contains(MaterialState.hovered)) {
        return TbtAppColors.orangeHover;
      }
      return TbtAppColors.text;
    }),
  ),
);
