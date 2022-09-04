import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = () {
  GoogleFonts.config.allowRuntimeFetching = false;
  return TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 45,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 26,
    ),
    displaySmall: GoogleFonts.crimsonPro(
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
  );
}();
