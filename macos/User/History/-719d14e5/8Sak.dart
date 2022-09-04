import 'package:flutter/material.dart';

int _selectedRadio = 0;

Widget radios() => StatefulBuilder(builder: (context, setState) {
      void selectRadio(idx) => setState(() => _selectedRadio = idx);
      return Row(children: [
        Radio<int>(
          value: 0,
          groupValue: _selectedRadio,
          onChanged: selectRadio,
        ),
        Radio<int>(
          value: 0,
          groupValue: _selectedRadio,
          onChanged: selectRadio,
        ),
        const Radio<int>(value: 0, groupValue: 0, onChanged: null),
        const Radio<int>(value: 0, groupValue: null, onChanged: null),
      ]);
    });
