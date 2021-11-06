import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'package:timeforlife/ui/statistical/statistical_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class StatisticalView extends GetWidget<StatisticalController> {
  final statisticalController = Get.lazyPut(() => StatisticalController());

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
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Thống kê',
                      style: TextStyle(
                          fontSize: SizeConst.size20,
                          color: ColorConstant.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  margin: EdgeInsets.only(
                      top: SizeConst.h32,
                      left: SizeConst.w10,
                      bottom: SizeConst.h10),
                ),
                ButtonsTabBar(
                  physics: NeverScrollableScrollPhysics(),
                  backgroundColor: Colors.transparent,
                  height: 50,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      child: Utils.customStaticfical(
                          colors: Colors.white,
                          colorText: ColorConstant.blue1,
                          text: 'Ngày'),
                    ),
                    Tab(
                      child: Utils.customStaticfical(
                          colors: Colors.white,
                          colorText: ColorConstant.blue1,
                          text: 'Tháng'),
                    ),
                    Tab(
                      child: Utils.customStaticfical(
                          colors: Colors.white,
                          colorText: ColorConstant.blue1,
                          text: 'Năm'),
                    )
                  ],
                ),
                Utils.getSpaceView(0, SizeConst.h32),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.0)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConst.w16,
                                      vertical: SizeConst.h32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.pickDate(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .calendar_today_outlined),
                                                      Utils.getSpaceView(
                                                          SizeConst.w10, 0),
                                                      Obx(() => Text(controller
                                                          .formatDate()))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            PopupMenuButton(
                                                child: ImageIcon(
                                                  AssetImage(
                                                      "assets/images/information_button.png"),
                                                  color: Color(0xFF3A5A98),
                                                ),
                                                itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        child: Utils.buildLegend(
                                                            ColorConstant.char1,
                                                            "Không quan trọng, khẩn cấp"),
                                                      ),
                                                      PopupMenuItem(
                                                        child: Utils.buildLegend(
                                                            ColorConstant
                                                                .status4,
                                                            "Không quan trọng,không khẩn cấp"),
                                                      ),
                                                      PopupMenuItem(
                                                        child: Utils.buildLegend(
                                                            ColorConstant
                                                                .status3,
                                                            "Quan trọng, không khẩn cấp"),
                                                      ),
                                                      PopupMenuItem(
                                                        child: Utils.buildLegend(
                                                            ColorConstant
                                                                .status2,
                                                            "Quan trọng, khẩn cấp"),
                                                      ),
                                                      PopupMenuItem(
                                                        child: Utils.buildLegend(
                                                            ColorConstant
                                                                .status5,
                                                            "Tạo công việc đúng thời hạn"),
                                                      ),
                                                    ])
                                          ],
                                        ),
                                      ),
                                      Obx(
                                        () => Container(
                                          height: SizeConst.h220,
                                          child: SfCircularChart(series: <
                                              CircularSeries>[
                                            DoughnutSeries<ChartData, String>(
                                                dataSource:
                                                    controller.chartData.value,
                                                pointColorMapper:
                                                    (ChartData data, _) =>
                                                        data.color,
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                        data.y),
                                          ]),
                                        ),
                                      ),
                                      Obx(
                                        () => Center(
                                          child: Text(
                                            'Tổng điểm KPI: ${controller.totalcomplete}/${controller.totalWork}',
                                            style: TextStyle(
                                                fontSize: SizeConst.size20,
                                                color: ColorConstant.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h16),
                                      Obx(
                                        () => Utils.customContianerStatistical(
                                            work: controller.listfail,
                                            textTitle:
                                                'Đang thực hiện: ${controller.totalfails} / ${controller.totalWork}'),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h16),
                                      Obx(
                                        () => Utils.customContianerStatistical(
                                            work: controller.listComplete,
                                            textTitle:
                                                'Hoàn thành ${controller.totalcomplete} / ${controller.totalWork}'),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.0)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConst.w16,
                                      vertical: SizeConst.h32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.pickMonth(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons
                                                        .calendar_today_outlined),
                                                    Utils.getSpaceView(
                                                        SizeConst.w10, 0),
                                                    Obx(() => Text(controller
                                                        .formarMonth()))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h10),
                                      Obx(
                                        () => Container(
                                            height: SizeConst.h220,
                                            child: SfCartesianChart(
                                                primaryXAxis: CategoryAxis(),
                                                series: <ChartSeries>[
                                                  SplineAreaSeries<SalesData,
                                                          String>(
                                                      dataSource: [
                                                        SalesData(
                                                            "Tuần 1",
                                                            controller
                                                                .week1.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tuần 2",
                                                            controller
                                                                .week2.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tuần 3",
                                                            controller
                                                                .week3.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tuần 4",
                                                            controller
                                                                .week4.value
                                                                .toDouble()),
                                                      ],
                                                      animationDelay: 1000,
                                                      color:
                                                          ColorConstant
                                                              .colorChar
                                                              .withOpacity(0.2),
                                                      borderWidth: 2,
                                                      animationDuration: 2000,
                                                      borderColor:
                                                          ColorConstant
                                                              .colorBorder,
                                                      xValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.year,
                                                      yValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.sales),
                                                ])),
                                      ),
                                      Center(
                                        child: Text(
                                          'Tổng điểm KPI: 4/6',
                                          style: TextStyle(
                                              fontSize: SizeConst.size20,
                                              color: ColorConstant.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                      Obx(() => Container(
                                          height: 600,
                                          child: Column(
                                            children: [
                                              Utils.customContainerStacticMonth(
                                                  title: "Tuần 1",
                                                  point:
                                                      '${controller.poinweek1}',
                                                  work: '${controller.week1}',
                                                  complete:
                                                      '${controller.totalcplweek1}',
                                                  fail:
                                                      '${controller.totalfailweek1}'),
                                              Utils.customContainerStacticMonth(
                                                  title: "Tuần 2",
                                                  point:
                                                      '${controller.poinweek2}',
                                                  work: '${controller.week2}',
                                                  complete:
                                                      '${controller.totalcplweek2}',
                                                  fail:
                                                      '${controller.totalfailweek2}'),
                                              Utils.customContainerStacticMonth(
                                                  title: "Tuần 3",
                                                  point:
                                                      '${controller.poinweek3}',
                                                  work: '${controller.week3}',
                                                  complete:
                                                      '${controller.totalcplweek3}',
                                                  fail:
                                                      '${controller.totalfailweek3}'),
                                              Utils.customContainerStacticMonth(
                                                  title: "Tuần 4",
                                                  point:
                                                      '${controller.poinweek4}',
                                                  work: '${controller.week4}',
                                                  complete:
                                                      '${controller.totalcplweek4}',
                                                  fail:
                                                      '${controller.totalfailweek4}'),
                                            ],
                                          )))

                                      // Utils.getSpaceView(0, SizeConst.h16),
                                      // Utils.customContianerStatistical(
                                      //     textTitle: 'Đang thực hiện: 2/6'),
                                      // Utils.getSpaceView(0, SizeConst.h16),
                                      // Utils.customContianerStatistical(
                                      //     textTitle: 'Hoàn thành 4/6'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.0)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConst.w16,
                                      vertical: SizeConst.h32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.picYear(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons
                                                        .calendar_today_outlined),
                                                    Utils.getSpaceView(
                                                        SizeConst.w10, 0),
                                                    Obx(() => Text(controller
                                                        .formatYear()))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h10),
                                      Obx(
                                        () => Container(
                                            height: SizeConst.h220,
                                            child: SfCartesianChart(
                                                primaryXAxis: CategoryAxis(),
                                                series: <ChartSeries>[
                                                  SplineAreaSeries<SalesData,
                                                          String>(
                                                      dataSource: [
                                                        SalesData(
                                                            "Tháng 1",
                                                            controller
                                                                .month1.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 2",
                                                            controller
                                                                .month2.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 3",
                                                            controller
                                                                .month3.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 4",
                                                            controller
                                                                .month4.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 5",
                                                            controller
                                                                .month5.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 6",
                                                            controller
                                                                .month6.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 7",
                                                            controller
                                                                .month7.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 8",
                                                            controller
                                                                .month8.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 9",
                                                            controller
                                                                .month9.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 10",
                                                            controller
                                                                .month10.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 11",
                                                            controller
                                                                .month11.value
                                                                .toDouble()),
                                                        SalesData(
                                                            "Tháng 12",
                                                            controller
                                                                .month12.value
                                                                .toDouble()),
                                                      ],
                                                      animationDelay: 1000,
                                                      color:
                                                          ColorConstant
                                                              .colorChar
                                                              .withOpacity(0.2),
                                                      borderWidth: 2,
                                                      animationDuration: 2000,
                                                      borderColor:
                                                          ColorConstant
                                                              .colorBorder,
                                                      xValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.year,
                                                      yValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.sales),
                                                ])),
                                      ),
                                      Center(
                                        child: Text(
                                          'Tổng điểm KPI: 4/6',
                                          style: TextStyle(
                                              fontSize: SizeConst.size20,
                                              color: ColorConstant.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Utils.getSpaceView(0, SizeConst.h20),
                                     Obx(()=> Container(
                                         height: 1700,
                                         child: Column(
                                           children: [
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 1",
                                                 point: '${controller.kpiyearm1.value}',
                                                 work:
                                                 '${controller.month1.value}',
                                                 complete: '${controller.workcompltem1.value}',
                                                 fail: '${controller.workfailm1.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 2",
                                                 point: '${controller.kpiyearm2.value}',
                                                 work:
                                                 '${controller.month2.value}',
                                                 complete: '${controller.workcompltem2.value}',
                                                 fail: '${controller.workfailm2.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 3",
                                                 point: '${controller.kpiyearm3.value}',
                                                 work:
                                                 '${controller.month3.value}',
                                                 complete: '${controller.workcompltem3.value}',
                                                 fail: '${controller.workfailm3.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 4",
                                                 point: '${controller.kpiyearm4.value}',
                                                 work:
                                                 '${controller.month4.value}',
                                                 complete: '${controller.workcompltem4.value}',
                                                 fail: '${controller.workfailm4.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 5",
                                                 point: '${controller.kpiyearm5.value}',
                                                 work:
                                                 '${controller.month5.value}',
                                                 complete: '${controller.workcompltem5.value}',
                                                 fail: '${controller.workfailm5.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 6",
                                                 point: '${controller.kpiyearm6.value}',
                                                 work:
                                                 '${controller.month6.value}',
                                                 complete: '${controller.workcompltem6.value}',
                                                 fail: '${controller.workfailm6.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 7",
                                                 point: '${controller.kpiyearm7.value}',
                                                 work:
                                                 '${controller.month7.value}',
                                                 complete: '${controller.workcompltem7.value}',
                                                 fail: '${controller.workfailm7.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 8",
                                                 point: '${controller.kpiyearm8.value}',
                                                 work:
                                                 '${controller.month8.value}',
                                                 complete: '${controller.workcompltem8.value}',
                                                 fail: '${controller.workfailm8.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 9",
                                                 point: '${controller.kpiyearm9.value}',
                                                 work:
                                                 '${controller.month9.value}',
                                                 complete: '${controller.workcompltem9.value}',
                                                 fail: '${controller.workfailm9.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 10",
                                                 point: '${controller.kpiyearm10.value}',
                                                 work:
                                                 '${controller.month10.value}',
                                                 complete: '${controller.workcompltem10.value}',
                                                 fail: '${controller.workfailm10.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 11",
                                                 point: '${controller.kpiyearm11.value}',
                                                 work:
                                                 '${controller.month11.value}',
                                                 complete: '${controller.workcompltem11.value}',
                                                 fail: '${controller.workfailm11.value}'),
                                             Utils.customContainerStacticMonth(
                                                 title: "Tháng 12",
                                                 point: '${controller.kpiyearm12.value}',
                                                 work:
                                                 '${controller.month12.value}',
                                                 complete: '${controller.workcompltem12.value}',
                                                 fail: '${controller.workfailm12.value}'),
                                           ],
                                         )))

                                      // Utils.getSpaceView(0, SizeConst.h16),
                                      // Utils.customContianerStatistical(
                                      //     textTitle: 'Đang thực hiện: 2/6'),
                                      // Utils.getSpaceView(0, SizeConst.h16),
                                      // Utils.customContianerStatistical(
                                      //     textTitle: 'Hoàn thành 4/6'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
//SingleChildScrollView(
//                   physics: NeverScrollableScrollPhysics(),
//                   child:
//                   Column(
//                     children: [
//                       Container(
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Thống kê',
//                             style: TextStyle(
//                                 fontSize: SizeConst.size20,
//                                 color: ColorConstant.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         margin: EdgeInsets.only(
//                             top: SizeConst.h32, left: SizeConst.w10),
//                       ),
//                       Utils.getSpaceView(0, SizeConst.h20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Utils.customStaticfical(
//                               colors: Colors.white,
//                               colorText: ColorConstant.blue1,
//                               text: 'Ngày'),
//                           Utils.customStaticfical(
//                               colors: Colors.white.withOpacity(0.4),
//                               colorText: ColorConstant.white,
//                               text: 'Tháng'),
//                           Utils.customStaticfical(
//                               colors: Colors.white.withOpacity(0.4),
//                               colorText: ColorConstant.white,
//                               text: 'Năm')
//                         ],
//                       ),
//                       Utils.getSpaceView(0, SizeConst.h32),
//                       Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(30.0)),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: SizeConst.w16,
//                                 vertical: SizeConst.h32),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         controller.pickDate(context);
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             border:
//                                                 Border.all(color: Colors.grey)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons
//                                                   .calendar_today_outlined),
//                                               Utils.getSpaceView(
//                                                   SizeConst.w10, 0),
//                                               Obx(() =>
//                                                   Text(controller.formatDate()))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     PopupMenuButton(
//                                         child: ImageIcon(
//                                           AssetImage(
//                                               "assets/images/information_button.png"),
//                                           color: Color(0xFF3A5A98),
//                                         ),
//                                         itemBuilder: (context) => [
//                                               PopupMenuItem(
//                                                 child: Utils.buildLegend(
//                                                     ColorConstant.char1,
//                                                     "Không quan trọng, khẩn cấp"),
//                                               ),
//                                           PopupMenuItem(
//                                             child: Utils.buildLegend(
//                                                 ColorConstant.status4,
//                                                 "Không quan trọng,không khẩn cấp"),
//                                           ),
//                                           PopupMenuItem(
//                                             child: Utils.buildLegend(
//                                                 ColorConstant.status3,
//                                                 "Quan trọng, không khẩn cấp"),
//                                           ),
//                                           PopupMenuItem(
//                                             child: Utils.buildLegend(
//                                                 ColorConstant.status2,
//                                                 "Quan trọng, khẩn cấp"),
//                                           ),
//                                           PopupMenuItem(
//                                             child: Utils.buildLegend(
//                                                 ColorConstant.status5,
//                                                 "Tạo công việc đúng thời hạn"),
//                                           ),
//                                             ])
//                                   ],
//                                 ),
//                                 Container(
//                                   height: SizeConst.h220,
//                                   child:
//                                       SfCircularChart(series: <CircularSeries>[
//                                     // Render pie char
//                                     DoughnutSeries<ChartData, String>(
//                                         dataSource: controller.chartData,
//                                         pointColorMapper: (ChartData data, _) =>
//                                             data.color,
//                                         xValueMapper: (ChartData data, _) =>
//                                             data.x,
//                                         yValueMapper: (ChartData data, _) =>
//                                             data.y),
//                                   ]),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     'Tổng điểm KPI: 4/6',
//                                     style: TextStyle(
//                                         fontSize: SizeConst.size20,
//                                         color: ColorConstant.black,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Utils.getSpaceView(0, SizeConst.h16),
//                                 Utils.customContianerStatistical(
//                                     textTitle: 'Đang thực hiện: 2/6'),
//                                 Utils.getSpaceView(0, SizeConst.h16),
//                                 Utils.customContianerStatistical(
//                                     textTitle: 'Hoàn thành 4/6'),
//                               ],
//                             ),
//                           )),
//                     ],
//                   ),
//                 )
