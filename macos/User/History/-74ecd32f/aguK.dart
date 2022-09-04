import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

bool a = true;
bool b = false;

Widget switches() => Row(
      children: [
        StatefulBuilder(
          builder: (context, setState) => Switch(
            activeColor: AppColors.orange,
            value: a,
            onChanged: (v) => setState(() => a = !a),
          ),
        ),
        StatefulBuilder(
          builder: (context, setState) => Switch(
            value: b,
            onChanged: (v) => setState(() => b = !b),
          ),
        ),
        const Switch(value: true, onChanged: null),
        const Switch(value: false, onChanged: null),
      ],
    );
