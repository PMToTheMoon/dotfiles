import 'package:flutter/material.dart';

class SearchBar extends TextField {
  SearchBar({
    super.key,
  }) : super(
          decoration: InputDecoration(
            prefix: Text("eyesy"),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
          ),
        );
}
