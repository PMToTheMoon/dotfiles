import 'package:flutter/material.dart';

List<Widget> checkboxes() => [
      Radio(value: 0, groupValue: null, onChanged: (_) {}),
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
