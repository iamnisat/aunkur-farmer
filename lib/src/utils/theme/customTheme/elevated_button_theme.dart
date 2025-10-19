import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); // To avoid creating instances

  /// Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryBlack,
      disabledForegroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      side: const BorderSide(color: Colors.transparent),

      textStyle: GoogleFonts.hindSiliguri(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size(double.infinity, 52), //////// HERE

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  /// Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryBlack,
      disabledForegroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      side: const BorderSide(color: Colors.transparent),
      textStyle: GoogleFonts.hindSiliguri(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size(double.infinity, 52), //////// HERE

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
