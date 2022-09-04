import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = () {
  GoogleFonts.config.allowRuntimeFetching = false;
  return TextTheme(
    // DISPLAYS
    displayLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600, //semi bold
      color: AppColors.black,
    ),
    // HEADLINES
    headlineLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      letterSpacing: .3,
      color: AppColors.black,
    ),
    // TITLES
    titleLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.black,
    ),
    // BODIES
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500, //medium
      color: AppColors.darkGray,
    ),
    // Labels
    labelLarge: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    ),
  );
};
