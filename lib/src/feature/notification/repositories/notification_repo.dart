
import 'package:aunkur_farmer/src/feature/notification/data/notification_model.dart';
import 'package:aunkur_farmer/src/service/localStorage/local_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationRepo {
// Create a new instance of the NotificationRepo
  NotificationRepo._();
  static final NotificationRepo instance = NotificationRepo._();

  // Store the notification in the local database
  Future<void> storeNotification(NotificationModel notification) async {
    try {
      final db = await DatabaseHelper.instance.database();
      final response = await db?.insert(
          DatabaseHelper.notificationTable, notification.toMap());
      debugPrint("Notification stored: $response");
      // Close the database connection
      await db?.close();
    } catch (e) {
      debugPrint("Error storing notification: $e");
    }
  }

  // Get notificatons from the local database
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final db = await DatabaseHelper.instance.database();
      final response = await db?.query(DatabaseHelper.notificationTable,
          orderBy: "${DatabaseHelper.columnCreateTime} DESC");

      // Close the database connection
      await db?.close();

      return response!
          .map<NotificationModel>(
              (json) => NotificationModel.fromLocalMap(json))
          .toList();
    } catch (e) {
      debugPrint("Error getting notifications: $e");
      return [];
    }
  }

  String formatDateWithSuffix(DateTime date) {
    var day = date.day;
    var suffix = "th";

    if (day == 1 || day == 21 || day == 31) suffix = "st";
    if (day == 2 || day == 22) suffix = "nd";
    if (day == 3 || day == 23) suffix = "rd";

    String formattedDate = DateFormat("d 'of' MMMM yyyy").format(date);
    return formattedDate.replaceFirst(day.toString(), "$day$suffix");
  }

  List<Map<String, List<NotificationModel>>> groupNotificationsAsListOfMaps(
      List<NotificationModel> notifications) {
    final Map<String, List<NotificationModel>> groupedByDate = {};

    for (var notification in notifications) {
      final createdDate =
          DateTime.fromMillisecondsSinceEpoch(notification.createdAt);
      final sortableDateKey =
          DateFormat('yyyy-MM-dd').format(createdDate); // Use for sorting

      if (!groupedByDate.containsKey(sortableDateKey)) {
        groupedByDate[sortableDateKey] = [];
      }
      groupedByDate[sortableDateKey]!.add(notification);
    }

    final sortedEntries = groupedByDate.entries.toList()
      ..sort((a, b) {
        final dateA = DateTime.parse(convertBengaliToEnglishNumerals(a.key));
        final dateB = DateTime.parse(convertBengaliToEnglishNumerals(b.key));
        return dateB.compareTo(dateA);
      });

    return sortedEntries.map((entry) {
      final displayKey = formatDateWithSuffix(
          DateTime.parse(convertBengaliToEnglishNumerals(entry.key)));
      return {displayKey: entry.value};
    }).toList();
  }

  String convertBengaliToEnglishNumerals(String bengaliDate) {
    const bengaliToEnglish = {
      '০': '0',
      '১': '1',
      '২': '2',
      '৩': '3',
      '৪': '4',
      '৫': '5',
      '৬': '6',
      '৭': '7',
      '৮': '8',
      '৯': '9',
    };

    String englishDate = bengaliDate;
    bengaliToEnglish.forEach((bengali, english) {
      englishDate = englishDate.replaceAll(bengali, english);
    });

    return englishDate;
  }

  // Delete notification from the local database by id
  Future<void> deleteNotification(int id) async {
    try {
      final db = await DatabaseHelper.instance.database();
      final response = await db?.delete(DatabaseHelper.notificationTable,
          where: "${DatabaseHelper.columnId} = ?", whereArgs: [id]);

      // Close the database connection
      await db?.close();

      debugPrint("Notification deleted: $response");
    } catch (e) {
      debugPrint("Error deleting notification: $e");
    }
  }
}
