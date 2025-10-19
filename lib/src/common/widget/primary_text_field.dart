import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

/// A customizable text field widget with advanced features.
///
/// The [PrimaryTextField] widget provides:
/// - [hintText]: The placeholder text shown when the field is empty.
/// - [helperText]: Additional helper text displayed below the text field.
/// - [controller]: The controller to handle the text field's value.
/// - [keyboardType]: The type of keyboard to display (e.g., text, number).
/// - [obscureText]: Whether the text should be obscured (e.g., for passwords).
/// - [readOnly]: If true, the text field is read-only.
/// - [enabled]: Whether the text field is enabled.
///
/// - [labelText]: A label displayed above the text field when it is focused or contains text.
/// - [errorText]: The error message displayed when the field is invalid.
/// - [prefixIcon]: An SVG icon displayed at the start of the text field.
/// - [suffixIcon]: An SVG icon displayed at the end of the text field.
/// - [onTap]: Callback function triggered when the text field is tapped.
/// - [onChanged]: Callback function triggered when the text changes.
/// - [borderRadius]: The border radius of the text field.
class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final String helperText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final String labelText;
  final String? errorText;
  final String prefixIcon;
  final String suffixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onTapSuffixIcon;

  /// Creates a [PrimaryTextField].
  ///
  /// The [hintText] and [controller] parameters are required. Default values are provided for other properties.
  const PrimaryTextField({
    super.key,
    required this.hintText,
     this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.labelText = '',
    this.errorText,
    this.prefixIcon = '',
    this.helperText = '',
    this.onTap,
    this.onChanged,
    this.borderRadius = 12,
    this.suffixIcon = '',
    this.inputFormatters = const [],
    this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        errorStyle: GoogleFonts.hindSiliguri(
          fontSize: 12,
          color: AppColors.primaryRead,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: AppColors.primaryBlack.withOpacity(0.6),
          fontWeight: FontWeight.w500,
        ),
        hintStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: const Color(0xffA9A9A9),
          fontWeight: FontWeight.w400,
        ),
        helperStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: const Color(0xffA9A9A9),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.primary.withOpacity(0.4)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Color(0xFFF6F6F6), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColors.primaryRead,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColors.primaryRead,
          ),
        ),
        prefixIcon: prefixIcon.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  prefixIcon,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlack,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        suffixIcon: suffixIcon.isNotEmpty
            ? GestureDetector(
                onTap: onTapSuffixIcon,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                      height: 28,
                      width: 28,
                      suffixIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryBlack,
                        BlendMode.srcIn,
                      )),
                ),
              )
            : null,
      ),
    );
  }
}

/// A search-specific text field with predefined styling.
///
/// The [SearchTextField] widget provides:
/// - [hintText]: The placeholder text shown when the field is empty.
/// - [helperText]: Additional helper text displayed below the text field.
/// - [controller]: The controller to handle the text field's value.
/// - [keyboardType]: The type of keyboard to display (e.g., text, number).
/// - [obscureText]: Whether the text should be obscured (e.g., for passwords).
/// - [readOnly]: If true, the text field is read-only.
/// - [enabled]: Whether the text field is enabled.
/// - [labelText]: A label displayed above the text field when it is focused or contains text.
/// - [errorText]: The error message displayed when the field is invalid.
/// - [prefixIcon]: An SVG icon displayed at the start of the text field.
/// - [suffixIcon]: An SVG icon displayed at the end of the text field.
class SearchTextField extends StatelessWidget {
  final String hintText;
  final String helperText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final String labelText;
  final String errorText;
  final String prefixIcon;
  final String suffixIcon;

  /// Creates a [SearchTextField].
  ///
  /// The [hintText] and [controller] parameters are required. Default values are provided for other properties.
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.labelText = '',
    this.errorText = '',
    this.prefixIcon = '',
    this.helperText = '',
    this.suffixIcon = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF6F6F6),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 2),
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        errorStyle: GoogleFonts.hindSiliguri(
          fontSize: 12,
          color: AppColors.primaryRead,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: const Color(0xffA9A9A9),
          fontWeight: FontWeight.w400,
        ),
        hintStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: const Color(0xffA9A9A9),
          fontWeight: FontWeight.w400,
        ),
        helperStyle: GoogleFonts.hindSiliguri(
          fontSize: 16,
          color: const Color(0xffA9A9A9),
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        prefixIcon: prefixIcon.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  prefixIcon,
                ),
              )
            : null,
        suffixIcon: suffixIcon.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  suffixIcon,
                ),
              )
            : null,
      ),
    );
  }
}
