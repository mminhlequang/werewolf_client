import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'barrel.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  try {
    FirebaseNotification firebaseNotification =
        FirebaseNotification.fromJson(message);
    LocalNotification.showNotification(
        firebaseNotification.notification.title,
        firebaseNotification.notification.body,
        firebaseNotification.data.toString());
    selectNotificationSubject.add(firebaseNotification.data.toString());
  } catch (e) {}
}
