import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 16, right: 16),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/loginicon2.svg',
                      height: SizeConst.h90,
                      width: SizeConst.w90,
                      allowDrawingOutsideViewBox: true,
                    ),
                    Utils.getSpaceView(0, SizeConst.h10),
                    Text('title'.tr,
                        style: TextStyle(
                          fontSize: SizeConst.size20,
                          color: ColorConstant.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Utils.getSpaceView(0, SizeConst.h50),
                    Utils.textFormFiled(_loginController.tecUsername,
                        onChange: ()=>_loginController.validateUsername(),
                        hintText: 'user'.tr, labelText: 'user'.tr),
                    Utils.getSpaceView(0, SizeConst.h24),
                    Utils.textFormFiled(
                      _loginController.tecPassword,
                      onChange: ()=>_loginController.validatePassWord(),
                      hintText: 'pass'.tr,
                      labelText: 'pass'.tr,
                      obscure: true,
                    ),
                    Utils.getSpaceView(0, SizeConst.h24),
                    InkWell(
                      onTap: () {
                        controller.login(_loginController.username.value,_loginController.password.value);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConst.h48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConst.r8),
                            color: ColorConstant.blue1),
                        child: Text('login'.tr,
                            style: TextStyle(
                                fontSize: SizeConst.size20,
                                color: ColorConstant.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Utils.getSpaceView(0, SizeConst.h24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('no account'.tr),
                        InkWell(
                          onTap: () {
                            _loginController.gotoSignUp();
                          },
                          child: Text(
                            'Register now'.tr,
                            style: TextStyle(
                                fontSize: SizeConst.size16,
                                color: ColorConstant.blue1,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Utils.getSpaceView(0, SizeConst.h10),
                    Text(
                      'loginvia'.tr,
                      style: TextStyle(
                        fontSize: SizeConst.size14,
                      ),
                    ),
                    Utils.getSpaceView(0, SizeConst.h32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            child: Image.asset('assets/images/google.png'),
                          onTap: (){
                              controller.loginGoogle();
                          },

                        ),
                        Utils.getSpaceView(SizeConst.w20, 0),
                        Image.asset('assets/images/facebook.png'),
                      ],
                    )
                    // RichText(
                    //   text: TextSpan(
                    //     text: 'Hello',
                    //     style: DefaultTextStyle.of(context).style,
                    //     children: [
                    //       TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
