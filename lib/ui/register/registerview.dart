import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/constant/string_constant.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:timeforlife/ui/register/register_controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: 
      SingleChildScrollView(
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
                    Text(StringConstant.titleLogin,
                        style: TextStyle(
                          fontSize: SizeConst.size20,
                          color: ColorConstant.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Utils.getSpaceView(0, SizeConst.h50),
                    Obx(()=>Utils.textFormFiled(
                        registerController.tecUsername,
                        hintText: 'user'.tr,
                        labelText: 'user'.tr,
                        errorText: registerController.errUsername.value,
                        onChange: ()=>registerController.validateUsername()),
                    ),
                    Utils.getSpaceView(0, SizeConst.h24),
                    Obx(()=>Utils.textFormFiled(
                      registerController.tecPassword,
                      hintText: 'pass'.tr,
                      labelText: 'pass'.tr,
                        errorText: registerController.errPassword.value,
                        onChange: ()=>registerController.validatePassWord(),
                      obscure: true,
                    ),),
                    Utils.getSpaceView(0, SizeConst.h24),
                    Obx(()=>Utils.textFormFiled(
                      registerController.tecRePassword,
                      hintText: 'confirmpassword'.tr,
                      labelText: 'confirmpassword'.tr,
                      errorText: registerController.errRePassword.value,
                      onChange: ()=>registerController.validateRePassWord(),
                      obscure: true,
                    ),),
                    Utils.getSpaceView(0, SizeConst.h24),
                    InkWell(
                      onTap: (){
                        registerController.createUser(controller.username.value,controller.password.value);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConst.h48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConst.r8),
                            color: ColorConstant.blue1),
                        child: Text('register'.tr,
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
                        Text('haveacount'.tr),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'loginnow'.tr,
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
                        IconButton(
                          icon: Image.asset('assets/images/google.png'),
                          iconSize: 50,
                          onPressed: () {
                            registerController.loginGoogle();
                          },
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/facebook.png'),
                          iconSize: 50,
                          onPressed: () {
                            registerController.loginFb();
                          },
                        ),

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
