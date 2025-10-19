
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// A customizable primary button widget that supports loading state, icons, and subtitles.
///
/// The [PrimaryButton] widget provides:
/// - [title]: The main text displayed on the button.
/// - [subTitle]: Optional subtitle text displayed below the title.
/// - [svgIcon]: Optional SVG icon displayed at the start of the button.
/// - [isLoading]: Indicates if the button is in a loading state.
/// - [isEnable]: Determines if the button is enabled.
/// - [onPressed]: Callback function triggered when the button is pressed.
/// - [borderRadius]: Defines the border radius of the button.
/// - [height]: Sets the height of the button.
/// - [backgroundColor]: Specifies the background color of the button when enabled.
/// - [textColor]: Sets the text color for the button title and subtitle.
/// - [borderColor]: Sets the color of the button border.
class PrimaryButton extends StatelessWidget {
  /// The main title of the button.
  final String title;

  /// The callback function triggered when the button is pressed.
  final VoidCallback onTap;

  /// Indicates if the button is in a loading state.
  /// When true, a loading indicator replaces the button title.
  final bool isLoading;

  /// Determines if the button is enabled.
  /// When false, the button is disabled and [onPressed] is ignored.
  final bool isEnable;

  /// Defines the border radius of the button.
  final double borderRadius;

  /// Sets the height of the button.
  final double height;

  /// Specifies the background color of the button when enabled.
  final Color backgroundColor;

  /// Sets the text color for the button title and subtitle.
  final Color textColor;

  /// Optional subtitle displayed below the title.
  final String subTitle;

  /// Optional SVG icon displayed at the start of the button.
  final String svgIcon;

  /// Sets the color of the button border.
  final Color borderColor;


  /// Creates a [PrimaryButton] widget.
  ///
  /// The [title] and [onTap] parameters are required. Default values are provided for other properties.
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.isEnable = true,
    this.borderRadius = 12,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.primaryWhite,
    this.subTitle = "",
    this.svgIcon = "",
    this.borderColor = Colors.transparent,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable && !isLoading ? onTap : null,
      style: ButtonStyle(
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: borderColor, width: 1),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          isEnable ? backgroundColor : AppColors.secondaryWhite,
        ),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.hindSiliguri(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Loading...",
                  style: GoogleFonts.hindSiliguri(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (svgIcon.isNotEmpty) ...[
                  SvgPicture.asset(
                    height: 30,
                    width: 30,
                    svgIcon,
                  ),
                  const SizedBox(
                    width: textLineGap * 2,
                  ),
                ],
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.hindSiliguri(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subTitle.isNotEmpty)
                      Text(
                        subTitle,
                        style: GoogleFonts.hindSiliguri(
                          fontSize: 12,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
              ],
            ),
    );
  }
}
