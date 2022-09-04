import 'package:flutter/material.dart';

int _selectedRadio = 0;

Widget radios() => StatefulBuilder(builder: (context, setState) {
      return Row(
        Radio<int>(value: 0, groupValue: 0, onChanged: (_) {}),
        Radio<int>(
          value: 0,
          groupValue: null,
          onChanged: (_) {},
        ),
        const Radio<int>(value: 0, groupValue: 0, onChanged: null),
        const Radio<int>(value: 0, groupValue: null, onChanged: null),
      );
    });
List<Widget> radios() => [];
