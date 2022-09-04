import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = () {
  GoogleFonts.config.allowRuntimeFetching = false;
  return TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 45,
      color: TbtAppColors.text,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 26,
      color: TbtAppColors.text,
    ),
    displaySmall: GoogleFonts.crimsonPro(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: TbtAppColors.text,
    ),

    // Headlines
    headlineLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: TbtAppColors.text,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: TbtAppColors.text,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: TbtAppColors.text,
    ),

    // Title
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: TbtAppColors.text,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: TbtAppColors.text,
    ),
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: TbtAppColors.text,
    ),

    // BODY
    bodyLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: TbtAppColors.text,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.darkerGray,
    ),
    bodySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: AppColors.darkGray,
    ),

    // labels
    labelLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.black,
    ),
    labelMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.black,
    ),
    labelSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: AppColors.black,
    ),
  );
}();
