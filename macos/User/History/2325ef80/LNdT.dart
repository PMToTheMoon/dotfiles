import 'package:flutter/material.dart';

MaterialStateProperty<T> tbtFeedback<T>(
  T normal, {
  T? pressed,
  T? emphasized,
  T? disabled,
}) =>
    MaterialStateProperty.resolveWith((states) {
      T? value;
      if (states.contains(MaterialState.disabled)) {
        value = disabled;
      } else if (states.contains(MaterialState.pressed)) {
        value = pressed;
      } else if (states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused)) {
        value = emphasized;
      }
      return value ?? normal;
    });
