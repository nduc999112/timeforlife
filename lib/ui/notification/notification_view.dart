import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';

import 'notification_controller.dart';

class NotificationView extends GetWidget<NotificationController> {
  // final  _controller = Get.lazyPut(() => NotificationController());
  final NotificationController notificationController = Get.put(NotificationController());
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConst.h32, left: SizeConst.w10),
                    height: SizeConst.h50,
                    child: Text(
                      'notification'.tr,
                      style: TextStyle(
                          fontSize: SizeConst.size20,
                          color: ColorConstant.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:
                     Obx(()=>
                         controller.listnotification==null || controller.listnotification.length<=0?Container(
                           width: double.infinity,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Center(
                                 child:  SvgPicture.asset(
                                     'assets/images/no-notification.svg',
                                     semanticsLabel: 'Acme Logo'
                                 ),
                               ),
                               Utils.getSpaceView(0, SizeConst.h20),
                               Text('nontification'.tr,style: TextStyle(color: Colors.black,fontSize: 20),)
                             ],
                           )):ListView.builder(
                           itemCount: controller.listnotification.length,
                           itemBuilder: (context, int) {
                             return Container(
                                 width: SizeConst.w398,
                                 height: SizeConst.h100,
                                 margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color: Colors.white,
                                     boxShadow: [
                                       BoxShadow(
                                           color: Colors.grey,
                                           blurRadius: 5,
                                           spreadRadius: 1,
                                           offset: Offset(1, 3))
                                     ]),
                                 child: Padding(
                                   padding: const EdgeInsets.all(16.0),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(
                                             'Bạn có công việc sắp đến hạn',
                                             style: TextStyle(
                                                 fontSize: SizeConst.size16,
                                                 color: ColorConstant.black,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           ImageIcon(
                                             AssetImage("assets/images/dottime.png"),
                                             color: Colors.green,
                                             size: 6,
                                           ),
                                         ],
                                       ),
                                       Utils.getSpaceView(0, SizeConst.h10),
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                             controller.listnotification[int].contentWork??'',
                                             style: TextStyle(
                                                 fontSize: SizeConst.size14,
                                                 color: ColorConstant.black,
                                                 fontWeight: FontWeight.normal),
                                           )),
                                       Align(
                                           alignment: Alignment.bottomRight,
                                           child: Text(
                                             '${controller.listnotification[int].endTime} ${controller.listnotification[int].dateTime}',
                                             style: TextStyle(
                                                 fontSize: SizeConst.size14,
                                                 color: ColorConstant.black,
                                                 fontWeight: FontWeight.normal,
                                                 fontStyle: FontStyle.italic),
                                           ))
                                     ],
                                   ),
                                 ));
                           },
                         ))
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
