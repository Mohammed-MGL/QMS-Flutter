import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:qms/Repo/Storage.dart';

class MessagingService {
  Future<void> initMessaging() async {
    // FirebaseApp firebaseInit = await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken();
    print('!!! ... $token');
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (selectNotification) async {
        print('$selectNotification');
      },
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification?.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              icon: android?.smallIcon,
              // other properties...
            )),
            payload: 'test 111');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Get.toNamed('/profile');
    });
    print("**************************");
    print(token);

    Storage storage = Storage();
    storage.saveFCMToken(token);

    // addTokenToApi(token);
  }

}
