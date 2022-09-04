import 'package:common/src/theme/theme_data/input_theme.dart';
import 'package:flutter/material.dart';

class SearchBar extends TextField {
  SearchBar({
    super.key,
  }) : super(
          decoration: searchBarDecorationTheme,)
}


