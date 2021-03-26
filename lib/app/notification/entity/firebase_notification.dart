import 'data.dart';
import 'notification.dart';

class FirebaseNotification {
  Notification notification;
  Data data;

  FirebaseNotification(
    this.notification,
    this.data,
  );

  factory FirebaseNotification.fromJson(Map<String, dynamic> json) =>
      FirebaseNotification(
        json['notification'] == null
            ? null
            : Notification.fromJson((json['notification'] as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )),
        json['data'] == null
            ? null
            : Data.fromJson((json['data'] as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'notification': this.notification,
        'data': this.data,
      };

  @override
  String toString() {
    return 'FirebaseNotification{notification: $notification, data: $data}';
  }
}
