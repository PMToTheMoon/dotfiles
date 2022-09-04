import 'package:flutter/material.dart';

class SearchBar extends TextField {
  SearchBar({
    super.key,
  }) : super(
          decoration: InputDecoration(
            prefix: Text("eyesy"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
          ),
        );
}
