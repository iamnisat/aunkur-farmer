import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Displays a custom confirmation dialog with customizable options.
///
/// [title] - Title of the dialog.
/// [content] - Content message of the dialog.
/// [yesBackgroundColor] - Background color for the "Yes" button.
/// [noBackgroundColor] - Background color for the "No" button.
/// [yesTextColor] - Text color for the "Yes" button.
/// [noTextColor] - Text color for the "No" button.
/// [iconSvg] - SVG icon path to display in the dialog.
/// [yesText] - Text for the "Yes" button. Defaults to "Sure".
/// [noText] - Text for the "No" button. Defaults to "Cancel".
/// [yesTextSize] - Font size for the "Yes" button text.
/// [noTextSize] - Font size for the "No" button text.
/// [onYes] - Callback function for the "Yes" button.
/// [onCancel] - Callback function for the "No" button.
void showCustomDialog(
  BuildContext context, {
  String title = "Are you sure?",
  String content = "Are you sure to delete this account?",
  Color yesBackgroundColor = AppColors.primary,
  Color noBackgroundColor = AppColors.primaryWhite,
  Color yesTextColor = Colors.white,
  Color noTextColor = AppColors.primaryBlack,
  String iconSvg = AppAssets.alertSVG,
  String? yesText,
  String? noText,
  double yesTextSize = 16,
  double noTextSize = 16,
  Function()? onYes,
  Function()? onCancel,
}) {
  yesText ??= S.current.yes;
  noText ??= S.current.no;

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGray,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SvgPicture.asset(
                    iconSvg,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(height: 10),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: const BorderSide(color: AppColors.lowWhite),
                          backgroundColor: noBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (onCancel != null) {
                            onCancel.call();
                          }
                        },
                        child: Text(
                          noText!,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: noTextSize,
                                color: noTextColor,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: yesBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (onYes != null) {
                            onYes.call();
                          }
                        },
                        child: Text(
                          yesText!,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: yesTextSize,
                                color: yesTextColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      // Add animation to the dialog small to large

      Tween<Offset> tween = Tween(begin: const Offset(0, 1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );
}

/// Displays a custom information dialog with a single button.
///
/// [title] - Title of the dialog.
/// [content] - Content message of the dialog.
/// [onYes] - Callback function for the button.
void showCustomInfoDialog({
  required String title,
  required String content,
  Function()? onYes,
}) {
  showGeneralDialog(
    context: navigatorKey.currentContext!,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, __, ___) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                Text(
                  content,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size(100, 40),
                    backgroundColor: AppColors.primaryGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onYes != null) {
                      onYes.call();
                    }
                  },
                  child: Text(
                    "Got it",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      // Add animation to the dialog small to large

      Tween<Offset> tween = Tween(begin: const Offset(0, 1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );
}
