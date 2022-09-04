import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kBorderRadius = 32;

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtTextField(
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          // borderSide: BorderSide(color: context.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          // borderSide: BorderSide(color: context.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          // borderSide: BorderSide(color: context.colorScheme.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kBorderRadius),
        ),
      ),
    );
  }
}
