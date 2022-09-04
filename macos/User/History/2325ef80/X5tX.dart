import 'package:flutter/material.dart';

MaterialStateProperty<T?> tbtFeedback<T>({
  T? idle,
  T? pressed,
  T? emphasized,
  T? disabled,
}) =>
    MaterialStateProperty.resolveWith((states) {
      T? value;
      if (states.contains(MaterialState.disabled)) {
        return disabled;
      } else if (states.contains(MaterialState.pressed)) {
        return pressed;
      } else if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        return emphasized;
      }
      return value ?? idle;
    });
