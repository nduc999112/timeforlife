import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/ui/detailuser/detail_user_view.dart';
import 'package:timeforlife/ui/detailuser/detailuser_controller.dart';
import 'package:timeforlife/ui/login/login_controller.dart';
import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class SettingController extends GetxController{
  var language=true;
  var textlanguage='Tiếng việt'.obs;
  User ?user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    LoginController workController = Get.find();
    user=workController.firebaseAuth.currentUser;
    print('setting ${user!.uid}');
  }
  void signout() async{
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    googleSignIn.isSignedIn().then((s) {print('đăng xuất thành công');});
    Get.offAll(LoginScreen());
  }

  void toDetailUser(){
    Get.to(() => DetailsUserView());

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