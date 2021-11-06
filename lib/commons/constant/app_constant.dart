import 'dart:ui';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'color_constant.dart';

class AppConstant{
  static TextStyle titleLogin = TextStyle(
    fontSize: SizeConst.size18,
    color: ColorConstant.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle btnLogin = TextStyle(
      fontSize: SizeConst.size20, color: ColorConstant.white, fontWeight: FontWeight.bold);

  static TextStyle registerText = TextStyle(
      fontSize: SizeConst.size20, color: ColorConstant.blue1, fontWeight: FontWeight.bold);

  static TextStyle itemTittle = TextStyle(
      fontSize: SizeConst.size20, color: ColorConstant.white, );

  static TextStyle titleMonth = TextStyle(
    fontSize: SizeConst.size24, color: ColorConstant.white,fontWeight: FontWeight.bold );

  static TextStyle lableSelect = TextStyle(
      fontSize: SizeConst.size13, color: ColorConstant.blue1,fontWeight: FontWeight.bold );

  static TextStyle unselectedLabelStyle = TextStyle(
      fontSize: SizeConst.size13, color: ColorConstant.blue2,);

  static TextStyle timeStyle = TextStyle(
    fontSize: SizeConst.size14, color: ColorConstant.timestatus,);

  static TextStyle title = TextStyle(
    fontSize: SizeConst.size18, color: ColorConstant.black,fontWeight: FontWeight.bold);

  static TextStyle titleTimeAdd = TextStyle(
      fontSize: SizeConst.size18, color: ColorConstant.black,fontWeight: FontWeight.bold);
}