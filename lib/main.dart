import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeforlife/translation/Messages.dart';
import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


import 'commons/constant/color_constant.dart';


Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // iphone 12 pro max
        designSize: Size(392.72727272727275,834.9090909090909),
        builder: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          return GetMaterialApp(
            defaultTransition: Transition.cupertino,
            // checkerboardRasterCacheImages: ,
            smartManagement: SmartManagement.keepFactory,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
            ],
            translations: LocaleString(),
            locale: Locale('vi','VN'),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // accentColor: Colors.blueAccent,
              // primaryColor: Colors.black,
              // indicatorColor: Colors.white,
              // canvasColor: Colors.white,
              // brightness: Brightness.dark,
              // primarySwatch: Colors.blue,
              // visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: ColorConstant.blue1,
              backgroundColor:ColorConstant.blue1,
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: Colors.blueAccent),
            ),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            home: LoginScreen(),
          );
        });
  }
}




