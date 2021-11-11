
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:timeforlife/ui/info/infoview.dart';
import 'package:timeforlife/ui/setting/setting_controller.dart';

class SettingView extends GetWidget<SettingController> {
  final _controller = Get.lazyPut(() => SettingController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            color: context.theme.scaffoldBackgroundColor
        ),
        Container(
          height: SizeConst.h250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('setting'.tr,
                          style: TextStyle(
                              fontSize: SizeConst.size20,
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Utils.getSpaceView(0, SizeConst.h10),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: (){
                          controller.toDetailUser();
                        },
                        child: Row(
                          children: [
                            controller.user!.photoURL!=null?CircleAvatar(
                                radius: 30,
                                backgroundImage: FileImage(File(controller.user!.photoURL??''))
                            ):CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg/800px-Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg')
                            ),
                            Utils.getSpaceView(SizeConst.w10, 0),
                            Text('${controller.user!.email}',
                                style: TextStyle(
                                    fontSize: SizeConst.size15,
                                    color: ColorConstant.white))
                          ],
                        ),
                      ),
                    ),
                    Utils.getSpaceView(0, SizeConst.h20),
                    SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Utils.customitemSetting(image: 'assets/images/gear.png',title: 'theme'.tr,visiable: true,coloricon: Colors.blue),
                              InkWell(
                                onTap: (){
                                  controller.changeColor();
                                },
                                child: Utils.customitemSetting(image: 'assets/images/fill-color.png',title: 'degreecolor'.tr,visiable: true,coloricon: Colors.deepPurple),
                              ),
                              Utils.customitemSetting2(image: 'assets/images/clock.png',title: 'worktime'.tr,coloricon: Colors.deepOrangeAccent,title2: '09:00     ->    10:00'),
                              Utils.customitemSetting2(image: 'assets/images/alarm-clock2.png',title: 'checktime'.tr,coloricon: Colors.green,title2: '09:00     ->    10:00'),
                              Utils.customitemSetting2(image: 'assets/images/iconmusic.png',title: 'sound'.tr,coloricon: Colors.green,title2: 'Mặc đinh(abcxyyyyy)'),
                              InkWell(
                                onTap: (){
                                  controller.changeLocation();
                                },
                                child: Utils.customitemSetting2(image: 'assets/images/translation.png',title: 'language'.tr,coloricon: Colors.blue,title2: 'textlanguage'.tr),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(()=>InfoView());
                                },
                                child: Utils.customitemSetting(image: 'assets/images/information.png',title: 'introduce'.tr,visiable: true,coloricon: Colors.orange),
                              ),
                              InkWell(
                                onTap: (){
                                  controller.signout();
                                },
                                child: Utils.customitemSetting(image: 'assets/images/logout.png',title: 'logout'.tr,visiable: true,coloricon: Colors.green),
                              ),
                              SizedBox(height: 50,)
                            ],
                          ),
                        ),

                    )
                  ],
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}
