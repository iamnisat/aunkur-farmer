import 'dart:async';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHelper {
  static OverlayEntry? _loader; // To store the loader entry

  /// Displays a loading spinner overlay on the screen.
  ///
  /// This method shows a loading spinner overlay on top of the current screen
  /// to indicate that a background process is ongoing. If the loader is already
  /// showing, this method does nothing.
  ///
  /// The overlay covers the entire screen with a semi-transparent grey color
  /// and displays a centered loading spinner.
  ///
  /// The loader is implemented using an [OverlayEntry] which is inserted into
  /// the overlay of the given [context].
  ///
  /// - Parameter context: The [BuildContext] to find the [Overlay] and [MediaQuery].
  ///
  /// Example usage:
  /// ```dart
  /// AppHelper.showLoader(context);
  /// ```
  static void showLoader(BuildContext context) {
    if (_loader != null) return; // If loader is already showing, do nothing

    _loader = OverlayEntry(
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Positioned(
          height: size.height,
          width: size.width,
          top: 0,
          left: 0,
          child: Material(
            color: Colors.grey.withOpacity(0.4),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_loader!); // Insert the loader
  }

  /// Hides the loader if it is currently displayed.
  ///
  /// This method checks if the loader is not null, and if so, schedules a
  /// timer to remove the loader after a delay of 500 milliseconds. Once the
  /// loader is removed, it resets the loader to null. If an exception occurs
  /// during the removal process, it is caught and can be handled if needed.
  static void hideLoader() {
    if (_loader != null) {
      Timer(const Duration(milliseconds: 500), () {
        try {
          _loader?.remove(); // Remove the loader
          _loader = null; // Reset the loader to null
        } catch (e) {
          // Handle exception if needed
        }
      });
    }
  }

  // Empty widget to show when there is no data
  /// Creates a widget that displays an empty view with an icon and a message.
  ///
  /// The empty view consists of a centered column containing an hourglass
  /// icon and a text message indicating that no data was found.
  ///
  /// Returns a [Widget] that represents the empty view.
  static Widget emptyView([
    String message =
        "Oops! There's nothing here right now. Please check back later.",
    String title = "Nothing to show",
  ]) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppAssets.emptyViewSVG, height: 100, width: 100),
            ),
            10.heightBox,
            Text(
              title,
              style: Theme.of(
                navigatorKey.currentContext!,
              ).textTheme.bodyMedium,
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(
                  navigatorKey.currentContext!,
                ).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Error widget to show when there is an error
  /// Creates a widget that displays an error view with an icon and a message.
  ///
  /// The error view consists of a centered column containing an error icon
  /// and a text message indicating that an error occurred.
  ///
  /// Returns a [Widget] that represents the error view.
  ///
  /// Example usage:
  /// ```dart
  /// AppHelper.errorView();
  /// ```
  ///
  ///
  ///

  static Widget errorView([String message = 'An error occurred']) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 50, color: AppColors.primary),
          SizedBox(height: 10),
          Text(
            'An error occurred',
            style: TextStyle(color: AppColors.primary, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
