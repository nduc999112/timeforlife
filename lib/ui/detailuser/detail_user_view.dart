import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';

import '../dialog.dart';
import 'detailuser_controller.dart';

class DetailsUserView extends GetWidget<DetailsUserController> {
  final _controller = Get.lazyPut(() => DetailsUserController());

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
          height: 250,
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
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: SizeConst.h33,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: SizeConst.h32,
                                width: SizeConst.h32,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  icon: Image.asset('assets/images/backicon.png'),
                                  iconSize: 50,
                                  onPressed: () {
                                    controller.back();
                                  },
                                ),
                              ),
                              Utils.getSpaceView(SizeConst.w10, 0),
                              Container(
                                child: Text(
                                  'Thông tin tài khoản',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConst.size18),
                                ),
                              )
                            ],
                          ),
                          Utils.getSpaceView(0, SizeConst.h20),
                          Container(
                            height: 750,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      Utils.getSpaceView(0, SizeConst.h40),
                                      InkWell(
                                        onTap: (){
                                          controller.getImage();
                                        },
                                        child:Obx(()=> CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.brown.shade800,
                                          backgroundImage: FileImage(File(controller.image.value)),
                                        ),)
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h40),
                                      Utils.textFormFiled(controller.tecName,
                                          onChange: ()=>controller.getName(),
                                          hintText: 'Họ và tên', labelText: 'Họ và tên'),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      Utils.textFormFiled(controller.tecUserName,
                                          onChange: ()=>controller.getUserName(),
                                          hintText: 'Tên đăng nhập', labelText: 'Tên đăng nhập'),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      Utils.textFormFiled(controller.tecEmail,
                                          onChange: ()=>controller.getEmail(),
                                          hintText: 'Email', labelText: 'Email'),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      Utils.textFormFiled(controller.tecPhone,
                                          onChange: ()=>controller.getPhone(),
                                          hintText: 'Số điện thoại', labelText: 'Số điện thoại'),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      Utils.textFormFiled(controller.tecPass,
                                          onChange: ()=>controller.getPass(),
                                          hintText: 'Mật khẩu', labelText: 'Mật khẩu'),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      InkWell(
                                        onTap: (){
                                          showDialog(context: context, builder: (BuildContext context) => Dialog(
                                            child: DialogDelete(),
                                          ));
                                        },
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text('Đổi mật khẩu',style: TextStyle(
                                                fontSize: SizeConst.size15, color: ColorConstant.black,fontWeight: FontWeight.bold),)),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      InkWell(
                                        onTap: (){
                                          controller.updateUserInfo();
                                          Get.back();
                                            // controller.changePassword('hiiamduc123','hiiamduc1234');
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: SizeConst.h48,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(SizeConst.r8),
                                              color: ColorConstant.blue1),
                                          child: Text('Cập nhật tài khoản',
                                              style: TextStyle(
                                                  fontSize: SizeConst.size20,
                                                  color: ColorConstant.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      )),
                ],
              ),
            )
          ),
        )
      ],
    );
  }
}
