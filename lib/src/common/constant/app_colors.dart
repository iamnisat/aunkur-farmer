import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF2c3644);

  static const Color primaryGray = Color(0xFFF9FAFD);
  static const Color secondaryGray = Color(0xFF9AA8C7);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color secondaryWhite = Color(0xFFEEEEEE);
  static const Color lowWhite = Color(0xFFE5E5E5);
  static const Color primaryBlack = Color(0xFF000000);
  static Color secondaryDark = const Color(0xFF000000).withOpacity(0.8);
  static const Color primaryRead = Colors.red;
  static Color secondaryRead = Colors.red.withOpacity(0.5);
  static const Color primaryYallow = Color(0xFFF2C94C);
  static const Color borderColor = Color(0xFFEDEDED);
  static const Color primaryGrey = Color(0XFF979799);

  // ✅ Pending
  static const Color pending = Color(0xFFFFC107); // Amber
  static const Color pendingBg = Color(0xFFFFF8E1);

  // ✅ In Progress
  static const Color inProgress = Color(0xFF2196F3); // Blue
  static const Color inProgressBg = Color(0xFFE3F2FD);

  // ✅ Rejected
  static const Color rejected = Color(0xFFE53935); // Red
  static const Color rejectedBg = Color(0xFFFFEBEE);

  // ✅ Approved
  static const Color approved = Color(0xFF4CAF50); // Green
  static const Color approvedBg = Color(0xFFE8F5E9);

  /// =====New Color Schema End===

  static const List<Color> profilePageColor = [
    Color(0xFFFFF3E0), // soft orange
    Color(0xFFE3F2FD), // pale blue
    Color(0xFFE8F5E9), // light green
    Color(0xFFF3E5F5), // gentle purple
  ];

  static const List<Color> requestStatusColors = [
    pending, // Pending
    inProgress, // In Progress
    rejected, // Rejected
    approved, // Approved
  ];
}
