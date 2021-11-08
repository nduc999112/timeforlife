import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/ui/notification/notification_view.dart';
import 'package:timeforlife/ui/setting/setting_view.dart';
import 'package:timeforlife/ui/statistical/statistical_view.dart';
import 'package:timeforlife/ui/work/work_view.dart';

import 'homepage_controller.dart';

class HomePageUI extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          children: [
            WorkView(),
            StatisticalView(),
            NotificationView(),
            SettingView(),

          ],
          index: homePageController.tabIndex.value,
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConst.h80,
        child: bottomNavigationBar(context, homePageController),
      ),
    );
  }

  bottomNavigationBar(context, controller) {
    return Obx(
          () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.75),
        child: BottomNavigationBar(
          onTap: (index) {
            controller.changeTabIndex(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:  Icon(Icons.article_rounded),
              title: Padding(
                padding: EdgeInsets.only(top: SizeConst.pad10),
                child: Text(
                  'Work'.tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              title: Padding(
                padding: EdgeInsets.only(top: SizeConst.pad10),
                child: Text(
                  'statistical'.tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              title: Padding(
                padding: EdgeInsets.only(top: SizeConst.pad10),
                child: Text(
                  'notification'.tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Padding(
                padding: EdgeInsets.only(top: SizeConst.pad10),
                child: Text(
                  'setting'.tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          currentIndex: controller.tabIndex.value,
          selectedLabelStyle: TextStyle(
              fontSize: SizeConst.size18, color: ColorConstant.blue1,fontWeight: FontWeight.bold ),
          unselectedLabelStyle: TextStyle(
            fontSize: SizeConst.size15, color: ColorConstant.blue2,),
          selectedItemColor: ColorConstant.blue1,
          unselectedItemColor: ColorConstant.blue2,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: SizeConst.size16,
          selectedIconTheme: IconThemeData(size: SizeConst.img26,color: ColorConstant.blue1,),
          unselectedIconTheme: IconThemeData(size: SizeConst.img20,color: ColorConstant.blue2,),
        ),
      ),
    );
  }
}
