import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const appBarTheme = AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  shape: ContinuousRectangleBorder(
    side: BorderSide(
      color: AppColors.lightGray,
    ),
  ),
);
