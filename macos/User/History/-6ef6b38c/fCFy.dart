import 'package:flutter/material.dart';

_buildButtons() => [
      ElevatedButton(onPressed: () {}, child: Text("Elevated")),
      OutlinedButton(onPressed: () {}, child: Text("Outlined")),
      HighlightedOutlinedButton(
          onPressed: () {}, child: Text("HighligtedOutlined")),
    ];
