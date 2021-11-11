

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class Utils {
  static Widget getSpaceView(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
  static customitemSetting2({String ? image,String ? title,Color ?coloricon,String ?title2}){
    return Container(
      margin: EdgeInsets.only(top: 20,left: 8,right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(3,1)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                ImageIcon(
                    AssetImage(image!),
                    color: coloricon
                ),
                Utils.getSpaceView(SizeConst.w20, 0),
                Text(title??'',style: TextStyle(
                  fontSize: SizeConst.size18, color: ColorConstant.black,)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 45,top: 10),
              child: Row(
                children: [
                  Text(title2!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  static customitemSetting({String ? image,String ?title,bool ? visiable,Color ? coloricon}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(3,1)
            )
          ]
      ),
      margin: EdgeInsets.only(top: 20,left: 8,right: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageIcon(
                    AssetImage(image!),
                    color: coloricon
                ),
                Utils.getSpaceView(SizeConst.w20, 0),
                Text(title??'',style: TextStyle(
                  fontSize: SizeConst.size18, color: ColorConstant.black,)),],
            ),
            Visibility(
              visible: visiable??false,
              child: ImageIcon(
                  AssetImage("assets/images/right-arrow.png"),
                  color: Colors.black
              ),
            ),


          ],
        ),
      ),
    );
  }
  static customContainerStacticMonth({String ?title,String ?point,String?work,String? complete,String ?fail}){
    return Container(
      //117,396
      margin: EdgeInsets.only(bottom: 20,left: 8,right: 8),
      height: SizeConst.h120,
      width: SizeConst.w398,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(1,5)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title??'',style: TextStyle(
                fontSize: SizeConst.size17, color: ColorConstant.blue1,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 1,
                color: ColorConstant.colorLine,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon1.svg',
                          ),
                          Utils.getSpaceView(SizeConst.w10, 0),
                          Text('Điểm: $point')
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon2.svg',
                          ),
                          Utils.getSpaceView(SizeConst.w10, 0),
                          Text('Công việc : $work')
                        ],
                      ),
                    ],
                  ),
                  Utils.getSpaceView(0, SizeConst.h20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon3.svg',
                          ),
                          Utils.getSpaceView(SizeConst.w10, 0),
                          Text('Hoàn thành: $complete')
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon4.svg',
                          ),
                          Utils.getSpaceView(SizeConst.w10, 0),
                          Text('Thất bại : $fail')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );

  }
  static customContainerStatus({String ? title,Color ? color,Function ?function}){
    return InkWell(
      onTap: () => function!.call(),
      child: Column(
        children: [
          Container(
            height: SizeConst.h70,
            width: SizeConst.w170,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text(
                  title??''
              ),
            ),
          )
        ],
      ),
    );
  }

  static customPickTime({String ? time}){
    return Container(
      height: SizeConst.h42,
      width: SizeConst.w170,
      decoration: BoxDecoration(
          color: ColorConstant.colorsTextField,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time??'00:00',style: TextStyle(
                fontSize: SizeConst.size18, color: ColorConstant.black,fontWeight: FontWeight.bold),),
            Icon(Icons.timer)
          ],
        ),
      ),
    );
  }

  static Widget customTimeline(
      {Color? coloricon,
      String? path,
      Color? colorStatus,
      String? timetitle,
      String? title,
      Color? coloralert,
      Color? colorring,
      Color? colorkpi,
      Function ? update,
      bool ? statusbutton
      }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  color: coloricon, borderRadius: BorderRadius.circular(50)),
              child: ImageIcon(
                AssetImage('assets/images/veri.png'),
                color: Colors.white,
              ),
            ),
            DottedLine(
              direction: Axis.vertical,
              lineLength: 69,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.grey,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            )
          ],
        ),
        Utils.getSpaceView(SizeConst.w10, 0),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorStatus,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/dottime.png"),
                          color: Colors.green,
                          size: 6,
                        ),
                        Utils.getSpaceView(SizeConst.w10, 0),
                        Text(
                          timetitle ?? '',
                          style: TextStyle(
                            fontSize: SizeConst.size14,
                            color: ColorConstant.timestatus,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Utils.customIcon(
                          color: coloralert ?? Colors.grey,
                          path: 'assets/images/alert.png',
                        ),
                        Utils.customIcon(
                            color: colorring ?? Colors.grey,
                            path:'assets/images/ringing.png'
                           ,
                            ),
                        Utils.customIcon(
                            color:  colorkpi ?? Colors.grey,
                            path:'assets/images/KPI.png',
                        )
                      ],
                    )
                  ],
                ),
                Utils.getSpaceView(0, SizeConst.h10),
                Text(
                  title ?? '',
                  style: TextStyle(
                      fontSize: SizeConst.size18,
                      color: ColorConstant.black,
                      fontWeight: FontWeight.bold),
                ),
                Utils.getSpaceView(0, SizeConst.h20),
                Visibility(
                  visible: statusbutton??false,
                  child: InkWell(
                    onTap: (){
                      update!.call();
                      print('Hoàn thành');
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: SizeConst.h24,
                        width: SizeConst.w96,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConst.r8),
                            color: ColorConstant.colorButton),
                        child: Center(
                          child: Text('Hoàn thành',
                              style: TextStyle(
                                  fontSize: SizeConst.size12,
                                  color: ColorConstant.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  static Widget buildLegend(Color colors, String title) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: colors,
          size: SizeConst.size20,
        ),
        Utils.getSpaceView(SizeConst.w10, 0),
        Flexible(
          child: Text(
            title,
          ),
        )
      ],
    );
  }

  static Widget customContianerStatistical({String ? textTitle,List<Work> ?work}){
    return  Container(
      width: SizeConst.w398,
      height: SizeConst.h120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 3), // ch
            )
          ]
      ),
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textTitle!,style: TextStyle(
                fontSize: SizeConst.size17, color: ColorConstant.colorTextStatic,fontWeight: FontWeight.bold),),
            Divider(
              thickness: 1,
              color: ColorConstant.colorLine,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  itemCount: work!.length,
                  itemBuilder: (context,int){
                    return
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.red,
                                ),
                                Utils.getSpaceView(SizeConst.w10, 0),
                                Text(
                                  work[int].contentWork??'',style: TextStyle(
                                    fontSize: SizeConst.size15, color: ColorConstant.black),
                                ),
                              ],
                            ),
                            Text(work[int].endTime??'')
                          ],
                        ),
                      );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
}
  static Widget customIcon({String ?path, Color? color}) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      child: ImageIcon(
        AssetImage(path!),
        color: Colors.white,
        size: 15,
      ),
    );
  }

  static setIconLogin({IconData? iconData, double? size, Color? color}) {
    color = color == null ? ColorConstant.black : color;
    size = size == null ? SizeConst.pad25 : size;
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }

  static textFormFiled(
    TextEditingController controller, {
    String? hintText,
    String? labelText,
    bool? obscure,
    Widget? icon,
    Function? onChange,
    String? errorText,
    Function? functionGo,
    String? focus,
  }) {
    return TextFormField(
        controller: controller,
        onChanged: (value) => onChange!.call(),
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: icon,
          hintText: hintText,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 2.0,
            ),
          ),
        ));
  }

  static customStaticfical({Color ? colors,Color ? colorText,String ? text}){
    return Container(
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(5)
      ),
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 10),
        child: Text(text??'',style: TextStyle(
            fontSize: SizeConst.size18, color: colorText,fontWeight: FontWeight.bold),),
      ),

    );
  }
}
