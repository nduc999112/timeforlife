import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Fcm2 extends StatefulWidget {
  const Fcm2({Key? key}) : super(key: key);

  @override
  _Fcm2State createState() => _Fcm2State();
}

class _Fcm2State extends State<Fcm2> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin fltNotification;

  void pushFCMtoken() async {
    String? token=await messaging.getToken();
    print(token);
//you will get token here in the console
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushFCMtoken();
    initMessaging();
  }
  void initMessaging() {
    var androiInit = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInit = IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting);
    var androidDetails =
    AndroidNotificationDetails("1", "channelName", "channel Description");
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification=message.notification;
      AndroidNotification? android=message.notification?.android;
      if(notification!=null && android!=null){
        fltNotification.show(
            notification.hashCode, notification.title, notification.body, generalNotificationDetails);
      }});}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('tesst'),
      ),
    );
  }
}
