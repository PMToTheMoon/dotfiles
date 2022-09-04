import 'package:flutter/material.dart';

Widget radios() => StatefulBuilder(builder: (context, setState) {
      return Row();
    });
List<Widget> radios() => [
      Radio<int>(value: 0, groupValue: 0, onChanged: (_) {}),
      Radio<int>(
        value: 0,
        groupValue: null,
        onChanged: (_) {},
      ),
      const Radio<int>(value: 0, groupValue: 0, onChanged: null),
      const Radio<int>(value: 0, groupValue: null, onChanged: null),
    ];
