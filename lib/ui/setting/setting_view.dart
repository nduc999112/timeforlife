import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
          color: ColorConstant.blue1,
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
                      child: Text('Cài đặt',
                          style: TextStyle(
                              fontSize: SizeConst.size20,
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Utils.getSpaceView(0, SizeConst.h10),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg/800px-Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg'),
                          ),
                          Utils.getSpaceView(SizeConst.w10, 0),
                          Text('Nguyễn Văn Đức',
                              style: TextStyle(
                                  fontSize: SizeConst.size20,
                                  color: ColorConstant.white)),
                        ],
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
                              Utils.customitemSetting(image: 'assets/images/gear.png',title: 'Chọn màu theme',visiable: true,coloricon: Colors.blue),
                              Utils.customitemSetting(image: 'assets/images/fill-color.png',title: 'Màu sắc độ',visiable: true,coloricon: Colors.deepPurple),
                              Utils.customitemSetting2(image: 'assets/images/clock.png',title: 'Thời gian lập công việc',coloricon: Colors.deepOrangeAccent,title2: '09:00     ->    10:00'),
                              Utils.customitemSetting2(image: 'assets/images/alarm-clock2.png',title: 'Thời gian kiểm tra lại công việc',coloricon: Colors.green,title2: '09:00     ->    10:00'),
                              Utils.customitemSetting2(image: 'assets/images/iconmusic.png',title: 'Âm thanh thông báo',coloricon: Colors.green,title2: 'Mặc đinh(abcxyyyyy)'),
                              Utils.customitemSetting2(image: 'assets/images/translation.png',title: 'Ngôn ngữ',coloricon: Colors.blue,title2: 'Tiếng việt'),
                              InkWell(
                                onTap: (){
                                  Get.to(()=>InfoView());
                                },
                                child: Utils.customitemSetting(image: 'assets/images/information.png',title: 'Giới thiệu',visiable: true,coloricon: Colors.orange),
                              ),
                              InkWell(
                                onTap: (){
                                  controller.signout();
                                },
                                child: Utils.customitemSetting(image: 'assets/images/logout.png',title: 'Đăng xuất',visiable: true,coloricon: Colors.green),
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
