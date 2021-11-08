import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';

import 'detail_work_controller.dart';

class DetailWorkView extends GetWidget<DetailWorkController> {

  final  _controller = Get.lazyPut(() => DetailWorkController());
  @override
  Widget build(BuildContext context) {
    return  Stack(
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
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: SizeConst.h33,
                          left: SizeConst.w10,
                          right: SizeConst.w10,
                          bottom: SizeConst.h20),
                      child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
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
                                    child: Text('Thông tin công việc',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: SizeConst.size18),),
                                  )
                                ],
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/delete.png'),
                                iconSize: 50,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
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
                                                InkWell(

                                                  child: Container(
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
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                InkWell(
                                                  child: Container(
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
                                                  ),
                                                  onTap: (){
                                                    controller.deleteData();
                                                    // controller.toWorkView();
                                                  },
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),);
                                },
                              )
                            ],
                          ),
                          Utils.getSpaceView(0, SizeConst.h20),
                          Container(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => DropdownButton<String>(
                                  isDense: true,
                                  style: TextStyle(color: Colors.white),
                                  dropdownColor: Colors.black,
                                  iconEnabledColor: ColorConstant.white,
                                  onChanged: (value) {
                                    // _addWorkController.onSelected(value.toString());
                                  },
                                  value: controller.dropdownValue.value ==
                                      ''
                                      ? null
                                      : controller.dropdownValue.value,
                                  elevation: 10,
                                  items: controller.language.map((value) {
                                    return DropdownMenuItem<String>(
                                      onTap: () => controller
                                          .onSelected(value),
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                )),
                                Text(
                                  'Tháng 9,2021',
                                  style: TextStyle(
                                      fontSize: SizeConst.size18,
                                      color: ColorConstant.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          controller.dropdownValue.value == 'Theo ngày'
                              ? CalendarTimeline(
                            showYears: false,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020, 1, 1),
                            lastDate: DateTime(2025, 11, 20),
                            onDateSelected: (date) => controller
                                .selectTimeDate(date.toString()),
                            leftMargin: 50,
                            monthColor: Colors.blueGrey,
                            dayColor: Colors.white,
                            activeDayColor: Colors.blueAccent,
                            activeBackgroundDayColor: Colors.white,
                            dotsColor: Color(0xFF333A47),

                            // selectableDayPredicate: (date) => date.day != 23,
                            locale: 'vi',
                          )
                              : Container(
                            margin: EdgeInsets.only(top: SizeConst.h32),
                            height: SizeConst.h42,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listDate.length,
                              itemBuilder: (context, int) {
                                return Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.white,
                                      child:
                                      InkWell(
                                        onTap: (){
                                          controller.getDateOfWeek(controller.listDate[int]);
                                        },
                                        child: Text(
                                          '${controller.listDate[int]}',
                                          style: TextStyle(
                                              color: controller.listDate[int]!='T7' && controller.listDate[int]!='CN'?ColorConstant.colorthu:ColorConstant.kpi,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ))),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Container(
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
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top: 30, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nhiệm vụ',
                                    style: TextStyle(
                                        fontSize: SizeConst.size18,
                                        color: ColorConstant.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.colorsTextField,
                                    ),
                                    child: TextFormField(
                                      controller:
                                      controller.tecNoiDungCongViec,
                                      onChanged: (value) {
                                        controller.onChange();
                                      },

                                      maxLines: 6,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                          hintText: "Nội dung công việc..."),
                                    ),
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            showPicker(
                                              context: context,
                                              value: controller.time,
                                              onChange: (value) {
                                                controller
                                                    .onTimeChangedStart(value);
                                              },
                                            ),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Bắt đầu',
                                              style: TextStyle(
                                                  fontSize: SizeConst.size18,
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Utils.getSpaceView(0, SizeConst.h10),
                                            Obx(() => Utils.customPickTime(
                                                time: controller
                                                    .timestart.value))
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            showPicker(
                                              context: context,
                                              value: controller.time,
                                              onChange: (value) {
                                                controller
                                                    .onTimeChangedEnd(value);
                                              },
                                            ),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Kết thúc',
                                              style: TextStyle(
                                                  fontSize: SizeConst.size18,
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Utils.getSpaceView(0, SizeConst.h10),
                                            Obx(() => Utils.customPickTime(
                                                time:
                                                controller.timeend.value))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h24),
                                  Text(
                                    'Mức độ ưu tiên',
                                    style: TextStyle(
                                        fontSize: SizeConst.size18,
                                        color: ColorConstant.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h10),
                                  Column(
                                    children: [
                                      Container(
                                        margin:
                                        EdgeInsets.only(bottom: SizeConst.h20),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Obx(
                                                  () => Utils.customContainerStatus(
                                                  title: 'Quan trọng',
                                                  color: controller
                                                      .clickStatus1.value
                                                      ? ColorConstant.status1
                                                      : Colors.grey[200],
                                                  function: () {
                                                    controller
                                                        .setColor1("Quan trọng");
                                                  }),
                                            ),
                                            Obx(
                                                  () => Utils.customContainerStatus(
                                                  title: 'Khẩn cấp',
                                                  color: controller
                                                      .clickStatus2.value
                                                      ? ColorConstant.status2
                                                      : Colors.grey[200],
                                                  function: () {
                                                    controller
                                                        .setColor2("Khẩn cấp");
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(
                                                () => Utils.customContainerStatus(
                                                title: 'Không quan trọng',
                                                color: controller
                                                    .clickStatus1.value
                                                    ? Colors.grey[200]
                                                    : ColorConstant.status3,
                                                function: () {
                                                  controller
                                                      .setColor1("Không quan trọng");
                                                }),
                                          ),
                                          Obx(
                                                () => Utils.customContainerStatus(
                                                title: 'Không khẩn cấp',
                                                color: controller
                                                    .clickStatus2.value
                                                    ? Colors.grey[200]
                                                    : ColorConstant.status4,
                                                function: () {
                                                  controller
                                                      .setColor2("Không khẩn cấp");
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h24),
                                  Text(
                                    'Nhắc nhở',
                                    style: TextStyle(
                                        fontSize: SizeConst.size18,
                                        color: ColorConstant.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h10),
                                  Container(
                                    height: SizeConst.h120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.colorsTextField,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timer),
                                              Utils.getSpaceView(SizeConst.w10, 0),
                                              InkWell(
                                                  onTap: () {
                                                    controller
                                                        .showdurationtime(context);
                                                  },
                                                  child: Obx(
                                                        () => Text(
                                                        'Trước ${controller.timeduration.value} '),
                                                  ))
                                            ],
                                          ),
                                          Utils.getSpaceView(0, SizeConst.h20),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectAlarm();
                                                      },
                                                      child: Obx(
                                                            () => Utils.customIcon(
                                                            path:
                                                            'assets/images/alert.png',
                                                            color: controller
                                                                .alarm.value
                                                                ? ColorConstant.alert
                                                                : Colors.grey),
                                                      )),
                                                  Utils.getSpaceView(
                                                      SizeConst.w10, 0),
                                                  Text('Alarm')
                                                ],
                                              ),
                                              Utils.getSpaceView(SizeConst.w100, 0),
                                              Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectNotification();
                                                      },
                                                      child: Obx(
                                                            () => Utils.customIcon(
                                                            path:
                                                            'assets/images/ringing.png',
                                                            color: controller
                                                                .notification
                                                                .value
                                                                ? ColorConstant
                                                                .ringing
                                                                : Colors.grey),
                                                      )),
                                                  Utils.getSpaceView(
                                                      SizeConst.w10, 0),
                                                  Text('Notification')
                                                ],
                                              ),
                                            ],
                                          ),
                                          Utils.getSpaceView(0, SizeConst.h10),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    controller.selectKPI();
                                                  },
                                                  child: Obx(
                                                        () => Utils.customIcon(
                                                        path: 'assets/images/KPI.png',
                                                        color: controller
                                                            .kpi.value
                                                            ? ColorConstant.kpi
                                                            : Colors.grey),
                                                  )),
                                              Utils.getSpaceView(SizeConst.w10, 0),
                                              Text('Đánh giá KPI')
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Utils.getSpaceView(0, SizeConst.h20),
                                  InkWell(
                                    onTap: () {
                                      controller.updateData();
                                      // controller.toWorkView();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: SizeConst.h48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(SizeConst.r8),
                                          color: ColorConstant.blue1),
                                      child: Text('Cập nhật',
                                          style: TextStyle(
                                              fontSize: SizeConst.size20,
                                              color: ColorConstant.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ))
                ],
              ),
            ),
          )
        ],

    );
  }
}
