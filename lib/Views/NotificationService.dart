import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> BackgroundHandler(RemoteMessage remoteMessage) async {
  log("Background Message: ${remoteMessage.notification?.title}");
}

class NotificationService {
  static Future<void> initialize() async {
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission();

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      // Background handler (correctly passed by reference)
      FirebaseMessaging.onBackgroundMessage(BackgroundHandler);

      // Foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        log("Foreground Message: ${event.notification?.title}");
      });

      // App opened from terminated state via notification
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          log("App opened from terminated: ${message.notification?.title}");
        }
      });

      // App in background and opened by tapping on notification
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        log("App opened from background: ${message.notification?.title}");
      });

      log("Messaging Authorized");
    } else {
      log("Messaging Not Authorized");
    }
  }
}
