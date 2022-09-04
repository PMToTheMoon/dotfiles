import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = () {
  GoogleFonts.config.allowRuntimeFetching = false;
  return TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 45,
      color: AppColors.black,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 26,
      color: AppColors.black,
    ),
    displaySmall: GoogleFonts.crimsonPro(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: AppColors.black,
    ),

    // TITLE
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColors.black,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: AppColors.black,
    ),
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: AppColors.black,
    ),

    // BODY
    bodyLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.black,
    ),
    bodySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.black,
    ),

    // BODY
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
