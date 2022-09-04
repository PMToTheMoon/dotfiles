import 'package:flutter/material.dart';

List<Widget> checkboxes() => [
      Radio<int>(value: 0, groupValue: 0, onChanged: (_) {}),
      Radio<int>(value: 0, groupValue: null, onChanged: (_) {}),
      const Radio<int>(value: 0, groupValue: 0, onChanged: null),
      const Radio<int>(value: 0, groupValue: null, onChanged: null),
    ];
