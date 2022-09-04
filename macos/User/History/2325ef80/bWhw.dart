import 'package:flutter/material.dart';

MaterialStateProperty<T> tbtFeedback<T>(
  T normal, {
  required T pressed,
  required T emphasized,
  required T disabled,
}) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabled;
      } else if (states.contains(MaterialState.pressed)) {
        return pressed;
      } else if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        return emphasized;
      }
      return normal;
    });
