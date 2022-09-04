import 'package:flutter/material.dart';

bool a = true;
bool b = false;

List<Widget> checkboxes() => [
      StatefulBuilder(
        builder: (context, setState) => Checkbox(
          value: a,
          onChanged: (v) => setState(() => a = !a),
        ),
      ),
      StatefulBuilder(
        builder: (context, setState) => Checkbox(
          value: b,
          onChanged: (v) => setState(() => b = !b),
        ),
      ),
      const Checkbox(value: true, onChanged: null),
      const Checkbox(value: false, onChanged: null),
    ];
