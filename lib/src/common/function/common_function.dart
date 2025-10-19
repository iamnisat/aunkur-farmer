import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class CommonFunction {
  // Check base64 image is valid or not and return true or false value as per condition
  static bool isBase64(String input) {
    try {
      if (input.length > 500) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false; // Decoding failed, so it's not a valid Base64 string
    }
  }

  // Function to check if a specific route is in the navigation stack
  static bool isRouteActive(BuildContext context, String routeName) {
    bool isActive = false;
    Navigator.popUntil(context, (route) {
      if (route.settings.name == routeName) {
        isActive = true;
      }
      return true;
    });
    return isActive;
  }

  // Get Language text by lan code
  static String getLanguageTextByCode(String code) {
    switch (code) {
      case 'en':
        return 'English';

      case 'bn':
        return "বাংলা";
      default:
        return 'English';
    }
  }

  static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning! ☀️";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon!";
    } else if (hour >= 17 && hour < 20) {
      return "Good Evening!";
    } else {
      return "Good Night!";
    }
  }

  /// Triggers the in-app review prompt for the user.
  ///
  /// This function checks if the device supports in-app reviews. If supported,
  /// it requests an in-app review. If not supported, it redirects the user to
  /// the app store listing for rating.
  ///
  /// It handles any errors that might occur during the process and logs them
  /// using `debugPrint`.
  ///
  /// Usage:
  /// ```dart
  /// await triggerInAppReview();
  /// ```
  ///
  /// Note: Ensure that the `in_app_review` package is properly configured in
  /// your project.
  // Function to trigger the in-app review prompt
  static Future<void> triggerInAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    try {
      // Check if the device supports in-app reviews
      if (await inAppReview.isAvailable()) {
        await inAppReview.openStoreListing();

        // Request in-app review
        // await inAppReview.requestReview();
      } else {
        // Redirect to app store for rating
        await inAppReview.openStoreListing();
      }
    } catch (e) {
      // Handle any errors
      debugPrint("Error triggering in-app review: $e");
    }
  }

  /// Launches the specified URL in the default browser.
  ///
  /// If the URL cannot be launched, a debug message is printed.
  ///
  /// Example:
  /// ```dart
  /// await CommonMethod.launchAnyUrl('https://www.example.com');
  /// ```
  static Future<void> launchAnyUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }
  }

  static String formatSeconds(int seconds) {
    // Create a Duration object from the given seconds
    Duration duration = Duration(seconds: seconds);

    // Use the toString method of the Duration class to get the formatted time
    String formattedTime = duration.toString().split('.').first;

    // Remove the leading "0:" if the duration is less than an hour
    if (formattedTime.startsWith("0:")) {
      formattedTime = formattedTime.substring(2);
    }

    return formattedTime;
  }

  // Agro Service Request type
  // Soil Testing = 1
  // Weather Advisory = 2
  // Advisory = 3

  static String getAgroServiceRequestType(int typeId) {
    switch (typeId) {
      case 1:
        return "Soil Testing";
      case 2:
        return "Weather Advisory";
      case 3:
        return "Advisory";
      default:
        return "Unknown";
    }
  }

  // List of Request Types CommonModel
  static List<CommonModel> getAgroServiceRequestTypeList() {
    return [
      CommonModel(
        id: 1,
        name: S.current.soilTesting,
        slug: AdvisoryType.SOIL_TEST.name,
      ),
      CommonModel(
        id: 2,
        name: S.current.weatherAdvisory,
        slug: AdvisoryType.WEATHER.name,
      ),
      CommonModel(
        id: 3,
        name: S.current.advisory,
        slug: AdvisoryType.ADVISORY.name,
      ),
    ];
  }

  // List of Years CommonModel
  static List<CommonModel> getYearList() {
    int currentYear = DateTime.now().year;
    return List.generate(8, (index) {
      int year = currentYear - index;
      return CommonModel(id: year, name: year.toString());
    });
  }

  // List of Seasons CommonModel
  static List<CommonModel> getSeasonList() {
    return [
      CommonModel(id: 1, name: S.current.robiSeasonDuration),
      CommonModel(id: 2, name: S.current.kharip1Duration),
      CommonModel(id: 3, name: S.current.kharip2Duration),
    ];
  }

  // Get season name by id
  static String getSeasonNameById(int id) {
    switch (id) {
      case 1:
        return S.current.robiSeasonDuration;
      case 2:
        return S.current.kharip1Duration;
      case 3:
        return S.current.kharip2Duration;
      default:
        return "Unknown";
    }
  }

  static String extractInitials(String fullName) {
    if (fullName.trim().isEmpty) return "U";

    final parts = fullName.trim().split(RegExp(r'\s+'));

    if (parts.length >= 2) {
      return (parts.first[0] + parts.last[0]).toUpperCase();
    } else {
      final word = parts.first;
      return word.length >= 2
          ? word.substring(0, 2).toUpperCase()
          : word[0].toUpperCase();
    }
  }

  // Request Status by id
  static String getRequestStatusById(int id) {
    switch (id) {
      case 1:
        return S.current.pending;
      case 2:
        return S.current.inProgress;
      case 3:
        return S.current.rejected;
      case 4:
        return S.current.approved;
      default:
        return "Unknown";
    }
  }

  // Get Request Status Color by id
  static Color getRequestStatusColorById(int id) {
    switch (id) {
      case 1:
        return AppColors.pending; // Pending
      case 2:
        return AppColors.inProgress; // In Progress
      case 3:
        return AppColors.rejected; // Rejected
      case 4:
        return AppColors.approved; // Approved
      default:
        return Colors.grey; // Unknown
    }
  }

  // Get Only Time with AM/PM : 12:00 PM or 12:00 AM
  static String millisToTime(int millis) {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(millis));
  }

  /// Formats timestamps for chat message lists and conversation previews.
  ///
  /// Example outputs:
  /// - "Just now"
  /// - "5 min ago"
  /// - "Yesterday"
  /// - "Mon, 5:30 PM"
  /// - "May 15"
  /// - "May 15, 2024"
  static String formatChatTimestamp(int timestamp) {
    if (timestamp == 0) return "";

    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    // Case 1: Just now
    if (difference.inSeconds < 60) {
      return "Just now";
    }

    // Case 2: Minutes ago
    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    }

    // Case 3: Hours ago (within same day)
    if (difference.inHours < 24 && now.day == dateTime.day) {
      return "${difference.inHours} hr ago";
    }

    // Case 4: Yesterday
    if (difference.inHours < 48 &&
        now.day - dateTime.day == 1 &&
        now.month == dateTime.month) {
      return "Yesterday";
    }

    // Case 5: Within the same week → show day name and time
    if (difference.inDays < 7) {
      final dayName = DateFormat.E().format(dateTime); // e.g. Mon, Tue
      final time = DateFormat.jm().format(dateTime); // e.g. 5:30 PM
      return "$dayName, $time";
    }

    // Case 6: Within the same year → show date and month
    if (dateTime.year == now.year) {
      return DateFormat.MMMd().format(dateTime); // e.g. May 15
    }

    // Case 7: Older → include year
    return DateFormat.yMMMd().format(dateTime); // e.g. May 15, 2023
  }

  static String convertNumEnToBn(dynamic eng, [bool isCurrency = false]) {
    String bengali = '';
    final oCcy = NumberFormat("#,##0.00", "en_US");

    if (preference.getString(AppConstant.language) == 'en') {
      return eng.toString();
    }
    if (isCurrency) {
      eng = oCcy.format(eng);
    }
    for (int i = 0; i < eng.toString().length; i++) {
      switch (eng.toString()[i]) {
        case '.':
          bengali = '$bengali.';
          break;
        case ',':
          bengali = '$bengali,';
          break;
        case '1':
          bengali = '$bengali১';
          break;
        case '2':
          bengali = '$bengali২';
          break;
        case '3':
          bengali = '$bengali৩';
          break;
        case '4':
          bengali = '$bengali৪';
          break;
        case '5':
          bengali = '$bengali৫';
          break;
        case '6':
          bengali = '$bengali৬';
          break;
        case '7':
          bengali = '$bengali৭';
          break;
        case '8':
          bengali = '$bengali৮';
          break;
        case '9':
          bengali = '$bengali৯';
          break;
        default:
          bengali = '$bengali০';
      }
    }
    return bengali.split('.').length > 1
        ? '${bengali.split('.')[0]}.${bengali.split('.')[1].substring(0, 1)}'
        : bengali.split('.')[0];
  }

  // Get current route name
  static String getCurrentRouteName() {
    String? routeName;
    Navigator.popUntil(navigatorKey.currentState!.context, (route) {
      routeName = route.settings.name;
      return true;
    });
    debugPrint("Current Route Name: $routeName");
    return routeName ?? '/';
  }
}
