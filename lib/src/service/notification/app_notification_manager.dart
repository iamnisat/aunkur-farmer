import 'dart:convert';

import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/service/localStorage/setup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseNotificationService {
  static final FirebaseNotificationService instance =
      FirebaseNotificationService._internal();

  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final Dio _dio = Dio();

  bool _isInitialized = false;

  FirebaseNotificationService._internal();

  Future<void> initialize() async {
    if (_isInitialized) {
      debugPrint("FirebaseNotificationService is already initialized.");
      return;
    }
    _isInitialized = true;

    _setupLocalNotifications();
    _setupFirebaseListeners();
  }

  void _setupLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      description: 'This channel is used for important notifications.',
    );

    _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  void _setupFirebaseListeners() {
    debugPrint("Setting up Firebase listeners");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final Map<String, dynamic> data = jsonDecode(message.data['data']);
      String notificationType = data["notificatin_type"] ?? "general";

      debugPrint("======Notification Type: $notificationType ===");
      debugPrint("======Date: ${message.data} ======");
      String currentRoute = CommonFunction.getCurrentRouteName();

      if (notificationType == "chat" &&
          currentRoute.contains("/ChatRoomPage")) {
        _notifyChatBloc(data);
      } else {
        // _storeNotification(message);
        _showLocalNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
        "Message opened with route_name: ${message.data['route_name']}",
      );
      _handleNotificationClick(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        debugPrint(
          "Initial message with route_name: ${message.data['route_name']}",
        );
        _handleNotificationClick(message);
      }
    });
  }

  void _notifyChatBloc(Map<String, dynamic> message) {
    final Map<String, dynamic> data = message['data'];
    final chatBloc = getIt<ChatBloc>();
    chatBloc.add(
      NewIncomingMessageEvent(
        conversationId: data['thread_module_id'],
        message: data['message'],
        time: DateTime.now(),
        id: data['id'],
      ),
    );
  }

  // void _storeNotification(RemoteMessage message) {
  //   final notificationModel = NotificationModel(
  //     title: message.notification?.title ?? "",
  //     body: message.notification?.body ?? "",
  //     routeName: message.data['route_name'] ?? "",
  //     imageUrl: message.data['large_image'] ?? "",
  //     id: DateTime.now().millisecondsSinceEpoch,
  //     isOpened: false,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //   );

  //   NotificationRepo.instance.storeNotification(notificationModel);
  //   debugPrint("Notification stored: ${message.notification?.title}");
  // }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    String? title = message.notification?.title;
    String? body = message.notification?.body;
    String? imageUrl = message.data['large_image'];

    NotificationDetails notificationDetails;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      notificationDetails = await _createNotificationWithImage(
        title,
        body,
        imageUrl,
      );
    } else {
      notificationDetails = _createSimpleNotification();
    }

    await _localNotificationsPlugin.show(
      message.hashCode,
      title,
      body,
      notificationDetails,
      payload: message.data['route_name'], // Pass route_name as payload
    );

    debugPrint("Local notification shown: $title");
  }

  Future<NotificationDetails> _createNotificationWithImage(
    String? title,
    String? body,
    String imageUrl,
  ) async {
    try {
      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/${DateTime.now().toIso8601String()}notification_image.jpg';

      await _dio.download(imageUrl, imagePath);

      final BigPictureStyleInformation bigPictureStyle =
          BigPictureStyleInformation(
            FilePathAndroidBitmap(imagePath),
            largeIcon: FilePathAndroidBitmap(imagePath),
            contentTitle: title,
            summaryText: body,
          );

      return NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          styleInformation: bigPictureStyle,
          importance: Importance.high,
          priority: Priority.high,
          // icon: '@drawable/ic_launcher',
          // sound: const RawResourceAndroidNotificationSound('slow_spring_board'),
        ),
      );
    } catch (e) {
      debugPrint("Error downloading image with Dio: $e");
      return _createSimpleNotification(); // Fallback to simple notification if download fails
    }
  }

  NotificationDetails _createSimpleNotification() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.high,
        priority: Priority.high,
        // sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      ),
    );
  }

  Future<void> _onDidReceiveNotificationResponse(
    NotificationResponse response,
  ) async {
    debugPrint("Notification tapped with route_name: ${response.payload}");
    if (response.payload != null && response.payload!.isNotEmpty) {
      _navigateToRoute(
        "/${response.payload!}",
      ); // Navigate using the route name from the payload
    }
    // Default to the notification page
    else {
      navigatorKey.currentState?.pushNamed('/RootScreen', arguments: 2);
    }
  }

  void _handleNotificationClick(RemoteMessage message) {
    final Map<String, dynamic> data = jsonDecode(message.data['data']);
    String notificationType = data["notificatin_type"] ?? "general";

    debugPrint("======Notification Type: $notificationType ===");
    debugPrint("======Date: ${message.data} ======");
    // String currentRoute = CommonFunction.getCurrentRouteName();
    String routeName = message.data['route_name'] ?? "/";
    if (routeName.isNotEmpty) {
      _navigateToRoute("/$routeName", data: message.data);
    } else {
      navigatorKey.currentState?.pushNamed('/RootScreen', arguments: 1);
    }
  }

  void _navigateToRoute(
    String routeName, {
    Map<String, dynamic> data = const {},
  }) {
    try {
      switch (routeName) {
        case "/Project":
          navigatorKey.currentState?.pushNamed('/RootScreen', arguments: 2);

          break;

        default:
          navigatorKey.currentState?.pushNamed('/RootScreen', arguments: 1);
      }
    } catch (e) {
      debugPrint("Error navigating to route $routeName: $e");
    }
  }
}
