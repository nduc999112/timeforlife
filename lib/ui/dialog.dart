import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:timeforlife/ui/dialog_controller.dart';

class DialogDelete extends GetWidget<DialogController> {
  final _controller = Get.lazyPut(() => DialogController());

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child:
         Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Đổi mật khẩu',style: TextStyle(
                    fontSize: SizeConst.size20, color: ColorConstant.black,fontWeight: FontWeight.bold),),
                Utils.getSpaceView(0, SizeConst.h20),
                Utils.textFormFiled(controller.tecCurrentPassword,
                    onChange: ()=>controller.getCurrentPassword(),
                    hintText: 'Mật khẩu cũ', labelText: 'Mật khẩu cũ'),
                Utils.getSpaceView(0, SizeConst.h20),
                Utils.textFormFiled(controller.tecNewPassword,
                    onChange: ()=>controller.getNewPassword(),
                    hintText: 'Mật khẩu mơi', labelText: 'Mật khẩu mới'),
                Utils.getSpaceView(0, SizeConst.h20),
                Utils.textFormFiled(controller.tecReNewPassword,
                    onChange: ()=>controller.getRReNewPassword(),
                    hintText: 'Xác nhận mật khẩu mới', labelText: 'Xác nhận mật khẩu mới'),
                Utils.getSpaceView(0, SizeConst.h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConst.h48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConst.r8),
                            color: ColorConstant.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                          child: Text('Hủy bỏ',
                              style: TextStyle(
                                  fontSize: SizeConst.size15,
                                  color: ColorConstant.blue1,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.changePass();
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConst.h48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConst.r8),
                            color: ColorConstant.blue1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                          child: Text('Xác nhận',
                              style: TextStyle(
                                  fontSize: SizeConst.size15,
                                  color: ColorConstant.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

      );


  }
}
