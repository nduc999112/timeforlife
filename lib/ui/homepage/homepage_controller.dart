
import 'package:get/get.dart';
import 'package:timeforlife/ui/notification/notification_controller.dart';
import 'package:timeforlife/ui/setting/setting_controller.dart';
import 'package:timeforlife/ui/statistical/statistical_controller.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class HomePageController extends GetxController {
  var tabIndex = 0.obs;
  // WorkController workController = Get.put(WorkController());
  // final  notificationController = Get.lazyPut(() => NotificationController());
  // // NotificationController totalController = Get.put(NotificationController());
  // StatisticalController statisticalController = Get.put(StatisticalController());
  // SettingController settingController = Get.put(SettingController());

  changeTabIndex(int index) async {
    tabIndex.value = index;
    if(index==0){
      WorkController workController=Get.find();
      workController.onInit();
    }
    if(index==1){
      StatisticalController staticController=Get.find();
      staticController.onInit();
    }
    if(index==2){
      NotificationController totalController = Get.find();
      totalController.onInit();
    }
    if(index==3){
      SettingController settingController = Get.find();
      settingController.onInit();
    }
    print(index);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
