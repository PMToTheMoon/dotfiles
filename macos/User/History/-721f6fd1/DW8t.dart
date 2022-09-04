import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

import 'tbt_text_field.dart';

const double _kBorderRadius = 40;

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TbtTextField(
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: context.l10n.search_bar_hint,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: const PaddingSmall.left(),
          child: Icon(
            Icons.search,
            color: context.colorScheme.onSurface,
            size: 16,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          borderSide: BorderSide(color: context.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          borderSide: BorderSide(color: context.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          borderSide: BorderSide(color: context.colorScheme.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
        ),
      ),
    );
  }
}
