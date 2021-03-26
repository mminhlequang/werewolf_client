import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../barrel.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log("OnBackgroundMessage: $message");
  return FirebaseCloudMessaging._handler(message);
}

class FirebaseCloudMessaging {
  static final FirebaseMessaging instance = FirebaseMessaging.instance;

  static initFirebaseMessaging() async {
    if (Platform.isIOS) {
      instance.requestPermission();
    }
    FirebaseMessaging.onMessage.listen((message) {
      log("OnMessage: $message");
      _handler(message, onlyShow: true);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("OnMessageOpenedApp: $message");
      _handler(message);
    });
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static _handler(RemoteMessage message, {bool onlyShow = false}) {
    if (onlyShow) {
      LocalNotification.showNotification(message.notification.title,
          message.notification.body, message.data.toString());
    } else {
      selectNotificationSubject.add(message.data.toString());
    }
  }
}
