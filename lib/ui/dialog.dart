import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';

class DialogDelete extends StatelessWidget {
  const DialogDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child:
        Dialog(
          insetPadding: EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Xác nhận',style: TextStyle(
                    fontSize: SizeConst.size22, color: ColorConstant.black,fontWeight: FontWeight.bold)),
                Utils.getSpaceView(0, SizeConst.h20),
                Text('Bạn có chắc chắn muốn xóa công việc này không ?',style:  TextStyle(
                    fontSize: SizeConst.size16, color: ColorConstant.black,fontWeight: FontWeight.normal),),
                Utils.getSpaceView(0, SizeConst.h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 45),
                        child: Text('Hủy bỏ',style:  TextStyle(
                            fontSize: SizeConst.size16, color: ColorConstant.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.colorthu,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 45),
                        child: Text('Đồng ý',style:  TextStyle(
                            fontSize: SizeConst.size16, color: ColorConstant.white,fontWeight: FontWeight.bold),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );


  }
}
