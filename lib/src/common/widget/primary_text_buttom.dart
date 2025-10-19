import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A simple text button widget with customizable text and style.
///
/// The [PrimaryTextButton] widget provides:
/// - [title]: The text displayed on the button.
/// - [onPressed]: Callback function triggered when the button is pressed.
/// - [textColor]: The color of the text.
/// - [textSize]: The size of the text.
class PrimaryTextButtom extends StatelessWidget {
  /// The text displayed on the button.
  final String title;

  /// The callback function triggered when the button is pressed.
  final VoidCallback onPressed;

  /// The color of the button text. Defaults to [AppColors.primaryBlack].
  final Color textColor;

  /// The size of the button text. Defaults to 12.
  final double textSize;

  /// Creates a [PrimaryTextButton].
  ///
  /// The [title] and [onPressed] parameters are required. Default values are provided for [textColor] and [textSize].
  const PrimaryTextButtom({
    super.key,
    required this.title,
    required this.onPressed,
    this.textSize = 13,
    this.textColor = AppColors.primaryBlack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        style: GoogleFonts.hindSiliguri(
          decoration: TextDecoration.underline,
          fontSize: textSize,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
