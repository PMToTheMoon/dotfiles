import 'package:flutter/material.dart';

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
