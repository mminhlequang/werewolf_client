
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../barrel.dart';

class LocalNotification {
  static const String _id = 'EnglishChallengeID';
  static const String _chanel = 'EnglishChallengeChannel';
  static const String _description = 'Description';

  static setup() async {
    //setup local notification
    notificationAppLaunchDetails =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    var initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');
    // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
    // of the `IOSFlutterLocalNotificationsPlugin` class
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
          selectNotificationSubject.add(payload);
          flutterLocalNotificationsPlugin.cancel(id);
        });
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          selectNotificationSubject.add(payload);
        });
  }

  static configureSelectNotificationSubject(BuildContext context) {
    selectNotificationSubject.stream.listen((String payload) async {
      if (payload == null) return;
      try {} catch (e) {} finally {
        selectNotificationSubject.add(null);
      }
    });
  }

  static Future<void> showNotification(
      String title, String body, String payload) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        _id, _chanel, _description,
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, '${title ?? 'null'} ', '${body ?? 'null'}', platformChannelSpecifics,
        payload: payload);
  }
}

