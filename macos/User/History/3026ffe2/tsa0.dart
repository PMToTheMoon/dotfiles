import 'package:flutter/material.dart';

bool a = true;
bool b = false;

List<Widget> checkboxes() => [
      StatefulBuilder(
        builder: (context, setState) => Checkbox(
          value: true,
          onChanged: (_) {},
        ),
      ),
      Checkbox(value: false, onChanged: (_) {}),
      Checkbox(
        value: true,
        onChanged: null,
      ),
      Checkbox(
        value: false,
        onChanged: null,
      ),
    ];
