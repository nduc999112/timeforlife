import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'add_work_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddWorkView extends GetWidget<AddWorkController> {
  final _controller = Get.lazyPut(() => AddWorkController());

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
            body: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: SizeConst.h33,
                        left: SizeConst.w10,
                        right: SizeConst.w10,
                        bottom: SizeConst.h20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Text(
                                'addnew'.tr,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => DropdownButton<String>(
                                    isDense: true,
                                    style: TextStyle(color: Colors.white),
                                    dropdownColor: Colors.black,
                                    iconEnabledColor: ColorConstant.white,
                                    onChanged: (value) {
                                      // _addWorkController.onSelected(value.toString());
                                    },
                                    value: controller.dropdownValue.value == ''
                                        ? null
                                        : controller.dropdownValue.value,
                                    elevation: 10,
                                    items: controller.language.map((value) {
                                      return DropdownMenuItem<String>(
                                        onTap: () =>
                                            controller.onSelected(value),
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  )),
                              Obx(() => Text(
                                    '${controller.timeDate}',
                                    style: TextStyle(
                                        fontSize: SizeConst.size18,
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        Obx(()=>controller.dropdownValue == 'Theo ngày'
                            ? CalendarTimeline(
                          showYears: false,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020, 1, 1),
                          lastDate: DateTime(2025, 11, 20),
                          onDateSelected: (date) => controller
                              .selectTimeDate(date.toString()),
                          leftMargin: 50,
                          monthColor: Colors.white,
                          dayColor: Colors.white,
                          activeDayColor: Colors.blueAccent,
                          activeBackgroundDayColor: Colors.white,
                          dotsColor: Color(0xFF333A47),

                          // selectableDayPredicate: (date) => date.day != 23,
                          locale: 'vi',
                        )
                            : MultiSelectChipField(
                          selectedChipColor: Colors.red,
                          items: controller.listDate
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
                          onTap: (value) {
                            // controller.listDate.remove(value);
                          },
                          itemBuilder: (item, state) {
                            // return your custom widget here
                            return InkWell(
                                onTap: () {
                                  controller.list.contains(item.value)
                                      ? controller.list.remove(item.value)
                                      : controller.list
                                      .add(item.value.toString());
                                  print(controller.list[0].toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: controller.list.contains(item.value)
                                          ? Colors.grey
                                          : Colors.white,
                                      child: Text(
                                        '${item.value}',
                                        style: TextStyle(
                                            color: item.value != 'T7' &&
                                                item.value != 'CN'
                                                ? ColorConstant.colorthu
                                                : ColorConstant.kpi,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ));
                          },
                        ))
                      ],
                    )),
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
                            const EdgeInsets.only(top: 30, left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'mission'.tr,
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
                                controller: controller.tecNoiDungCongViec,
                                onChanged: (value) {
                                  controller.onChange();
                                },
                                autofocus: false,
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
                                    hintText: "workcontent".tr),
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
                                          controller.onTimeChangedStart(value);
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'start'.tr,
                                        style: TextStyle(
                                            fontSize: SizeConst.size18,
                                            color: ColorConstant.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h10),
                                      Obx(() => Utils.customPickTime(
                                          time: controller.timestart.value))
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
                                          controller.onTimeChangedEnd(value);
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'end'.tr,
                                        style: TextStyle(
                                            fontSize: SizeConst.size18,
                                            color: ColorConstant.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h10),
                                      Obx(() => Utils.customPickTime(
                                          time: controller.timeend.value))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Utils.getSpaceView(0, SizeConst.h24),
                            Text(
                              'prioritylevel'.tr,
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
                                            title: 'important'.tr,
                                            color: controller.clickStatus1.value
                                                ? ColorConstant.status1
                                                : Colors.grey[200],
                                            function: () {
                                              controller
                                                  .setColor1("Quan trọng");
                                            }),
                                      ),
                                      Obx(
                                        () => Utils.customContainerStatus(
                                            title: 'emergency'.tr,
                                            color: controller.clickStatus2.value
                                                ? ColorConstant.status2
                                                : Colors.grey[200],
                                            function: () {
                                              controller.setColor2("Khẩn cấp");
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
                                          title: 'notimportant'.tr,
                                          color: controller.clickStatus1.value
                                              ? Colors.grey[200]
                                              : ColorConstant.status3,
                                          function: () {
                                            controller
                                                .setColor1("Không quan trọng");
                                          }),
                                    ),
                                    Obx(
                                      () => Utils.customContainerStatus(
                                          title: 'noturgent'.tr,
                                          color: controller.clickStatus2.value
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
                              'remind'.tr,
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
                                                  controller.selectAlarm();
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
                                            Text('alarm'.tr)
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
                                            Text('notification'.tr)
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
                                                  color: controller.kpi.value
                                                      ? ColorConstant.kpi
                                                      : Colors.grey),
                                            )),
                                        Utils.getSpaceView(SizeConst.w10, 0),
                                        Text('evaluate'.tr)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Utils.getSpaceView(0, SizeConst.h20),
                            InkWell(
                              onTap: () {
                                controller.insertData();
                                controller.toWorkView();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: SizeConst.h48,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(SizeConst.r8),
                                    color: ColorConstant.blue1),
                                child: Text('save'.tr,
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
