import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class SettingController extends GetxController{
  var language=true;
  var textlanguage='Tiếng việt'.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WorkController workController = Get.find();
    User ?user;
    user=workController.user;
    print('setting ${user!.uid}');
  }
  void signout() async{
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    googleSignIn.isSignedIn().then((s) {print('đăng xuất thành công');});
    Get.offAll(LoginScreen());
  }
  void changeLocation(){
    language=!language;
    if(language){
      var locale = Locale('en','US');
      Get.updateLocale(locale);
      textlanguage.value='English';
    }
    else{
      var locale = Locale('vi','VN');
      Get.updateLocale(locale);
      textlanguage.value='Tiếng việt';
    }
  }
  void changeColor(){
    Get.changeTheme(
        Get.isDarkMode ? lightTheme() : darkTheme());
  }
  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey[900]);
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(scaffoldBackgroundColor: ColorConstant.blue1);
  }
}