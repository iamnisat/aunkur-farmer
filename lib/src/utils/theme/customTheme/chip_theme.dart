import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TChipTheme {
  TChipTheme._();

  static final lightChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      labelStyle: GoogleFonts.poppins(
        color: AppColors.primaryBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: GoogleFonts.poppins(
        color: AppColors.primaryWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      selectedColor: AppColors.primaryBlack.withOpacity(0.7),
      backgroundColor: AppColors.secondaryWhite,
      side: const BorderSide(color: AppColors.primary, width: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
     
      checkmarkColor: Colors.white,
      showCheckmark: false); // ChipThemeData

  static final darkChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: GoogleFonts.poppins(
        color: AppColors.primaryWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: GoogleFonts.poppins(
        color: AppColors.primaryBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      selectedColor: AppColors.primaryWhite.withOpacity(0.7),
      backgroundColor: AppColors.primaryBlack,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
      checkmarkColor: Colors.white,
      showCheckmark: false); // ChipThemeData
}
