import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class SendNotifiation {
  static sendPushNotification(String token, String title, String body) async {
    try {
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAAsqFCeIw:APA91bGk_GTcdojTm72BDR5hbV_dkBkmIJchAlkTRe5QsvvVDS8VRp-JyKz0QlENvZ7PMzBuxJmoDP5EQzbO_A-repYLmPUrq_Va-nEapXYLYs0sOuJ6fphaPUTyXkPB6oooXnvZHMIs"
          },
          body: jsonEncode(<String, dynamic>{
            "priority": "high",
            "data": <String, dynamic>{
              "click_action": "FLUTTER_NOTIFICATION_CLICK",
              "status": "done",
              "body": body,
              "title": title,
            },
            "to": token,
            "notification": {
              "title": title,
              "body": body,
              "mutable_content": true,
              "sound": "Tri-tone",
              "android_channel_id": "abce"
            },
          }));
    } catch (e) {
      print("some error");
    }
  }

  static void calling(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings notificationSettings =
        await messaging.requestPermission(
            alert: true,
            announcement: false,
            badge: false,
            carPlay: false,
            sound: true,
            provisional: false,
            criticalAlert: false);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  getPermession() async {}
}
