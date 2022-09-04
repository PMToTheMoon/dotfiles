import 'package:common/src/theme/theme_data/input_theme.dart';
import 'package:flutter/material.dart';

class SearchBar extends TextField {
  SearchBar({
    super.key,
  }) : super(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusColor: AppColors.orange,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: AppColors.gray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: AppColors.darkGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: AppColors.orange),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            hintStyle:
                textTheme.titleMedium?.copyWith(color: AppColors.darkGray),
            hoverColor: AppColors.darkestGray,
          ),
        );
}
