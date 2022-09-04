import 'package:flutter/material.dart';

class SearchBar extends TextField {
  SearchBar({
    super.key,
  }) : super(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
          ),
        );
}
