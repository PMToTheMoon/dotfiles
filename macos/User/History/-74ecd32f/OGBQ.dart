import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

bool a = true;
bool b = false;

Widget switches() => Container(
      color: AppColors.gray,
      child: Row(
        children: [
          SwitchTheme(
            data: SwitchThemeData(),
            child: StatefulBuilder(
              builder: (context, setState) => Switch(
                // activeColor: AppColors.orange,
                // activeTrackColor: AppColors.white,
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.orangeHover;
                  }
                  return AppColors.blueHover;
                }),
                // inactiveThumbColor: AppColors.white,
                // inactiveTrackColor: AppColors.lightGray,
                thumbColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.disabled;
                  }
                  if (states.contains(MaterialState.selected)) {
                    if (states.contains(MaterialState.hovered)) {
                      return AppColors.orangeAccent;
                    }
                    return AppColors.orange;
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return AppColors.lightBlue;
                  }
                  return AppColors.white;
                }),
                trackColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.disabled;
                  }
                }),
                value: a,
                onChanged: (v) => setState(() => a = !a),
              ),
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
      ),
    );
