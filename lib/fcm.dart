
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.title);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.title!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    FirebaseMessaging.onMessageOpenedApp.listen((message) {
                      print('Message clicked!');
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Container(
        child: Text('Hello'),
      ),
    );
  }
}
