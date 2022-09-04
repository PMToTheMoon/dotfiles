import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = () {
  GoogleFonts.config.allowRuntimeFetching = false;
  return TextTheme(
    // DISPLAYS
    displayLarge: GooglFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    displayMedium: GooglFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    displaySmall: GooglFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    // HEADLINES
    headlineLarge: GooglFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    headlineMedium: GooglFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    headlineSmall: GooglFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    // TITLES
    titleLarge: GooglFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    titleMedium: GooglFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    titleSmall: GooglFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    // BODIES
    bodyLarge: GooglFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    bodyMedium: GooglFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    bodySmall: GooglFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    // Labels
    labelLarge: GooglFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelMedium: GooglFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    labelSmall: GooglFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    ),
  );
};
