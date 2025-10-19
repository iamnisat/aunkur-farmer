import 'package:aunkur_farmer/src/service/localStorage/local_database_helper.dart';

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String imageUrl;
  final String routeName;
  final bool isOpened;
  final int createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.routeName,
    required this.isOpened,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: json['title'],
      body: json['body'],
      imageUrl: json['imageUrl'],
      routeName: json['routeName'],
      isOpened: json['isOpened'],
      createdAt: json['createdAt'],
    );
  }

  factory NotificationModel.fromLocalMap(Map<String, dynamic> json) {
    return NotificationModel(
      id: json[DatabaseHelper.columnId],
      title: json[DatabaseHelper.columnTitle],
      body: json[DatabaseHelper.columnBody],
      imageUrl: json[DatabaseHelper.columnImageUrl],
      routeName: json[DatabaseHelper.columnRouteName],
      isOpened: json[DatabaseHelper.columnIsOpened] == 1,
      createdAt: json[DatabaseHelper.columnCreateTime],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnBody: body,
      DatabaseHelper.columnImageUrl: imageUrl,
      DatabaseHelper.columnRouteName: routeName,
      DatabaseHelper.columnIsOpened: isOpened ? 1 : 0,
      DatabaseHelper.columnCreateTime: createdAt,
    };
  }

}
