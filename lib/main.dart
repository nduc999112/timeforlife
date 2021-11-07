import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'NotificationApi.dart';
import 'commons/constant/color_constant.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotification();
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
            supportedLocales: [
              Locale('vi', 'VI'),
            ],
            locale: Locale('vi', 'VI'),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // accentColor: Colors.blueAccent,
              // primaryColor: Colors.black,
              // indicatorColor: Colors.white,
              // canvasColor: Colors.white,
              // brightness: Brightness.dark,
              // primarySwatch: Colors.blue,
              // visualDensity: VisualDensity.adaptivePlatformDensity,

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




