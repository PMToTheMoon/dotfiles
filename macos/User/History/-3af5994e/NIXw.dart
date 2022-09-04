import 'package:flutter/material.dart';

import '_app_colors.dart';

class AppStyles {
  static TextStyle authenticationTitle(context) => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );

  static TextStyle authenticationDescription(context) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.black..withOpacity(0.7),
      );
}
