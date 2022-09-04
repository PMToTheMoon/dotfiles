import 'package:flutter/material.dart';

/// A collection of convenience method to access theme
extension NeatThemeAccessors on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
