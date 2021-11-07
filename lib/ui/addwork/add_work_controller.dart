import 'package:duration_picker/duration_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class AddWorkController extends GetxController{
  User ? user;

  var listDate=[
    'T2',
    'T3',
    'T4',
    'T5',
    'T6',
    'T7',
    'CN'
  ];
  var prioritylevel1=''.obs;
  var prioritylevel2=''.obs;

  var dropdownValue = 'Theo ngày'.obs ;
  var timestart='00:00'.obs;
  var timeend='00:00'.obs;
  var timeduration=''.obs;

  var alarm=false.obs;
  var notification=false.obs;
  var kpi=false.obs;

  var timeDate='${DateTime.now()}'.obs;

  var clickStatus1 = false.obs;
  var clickStatus2 = false.obs;

  var dateOfWeek=''.obs;

  var tecNoiDungCongViec = TextEditingController();

  Rx<dynamic> noiDungCongViec = Rxn();

  TimeOfDay time = TimeOfDay.now().replacing(minute: 30);
  var language = <String>['Hàng ngày', 'Theo ngày'];

  final databaseRef=FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    // TODO: implement onInit
    user = Get.arguments;
    selectTimeDate1();
    print('reload');
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void toWorkView(){
    WorkController workController=Get.find();
    workController.onInit();
    Get.back();
  }

  void selectTimeDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value=outputFormat.format(inputDate);
    print(timeDate.value);
  }

  void selectTimeDate1() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse('${DateTime.now()}');
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value=outputFormat.format(inputDate);
    print(timeDate.value);
  }

  void getDateOfWeek(String value){
    dateOfWeek.value=value;
    print('date of week ${dateOfWeek.value}');
  }

  void insertData() async{
    var key=user!.uid.toString();
   await databaseRef.child('Work').child(key).push().set({
        'id':user!.uid,
        'Status': false,
        'DateTime':timeDate.value,
        'ContentWork':noiDungCongViec.value,
        'StartTime':timestart.value,
        'EndTime':timeend.value,
        'PriorityLevel1':prioritylevel1.value,
        'PriorityLevel2':prioritylevel2.value,
        'TimeDuration':timeduration.value,
        'alarm':alarm.value,
        'notification':notification.value,
        'kpi':kpi.value
    }).catchError((onError){
      print('error ${onError}');
    });

  }
  void onChange(){
    noiDungCongViec.value = tecNoiDungCongViec.value.text.toString().trim();
    print( noiDungCongViec.value);
  }

  void showdurationtime(BuildContext context) async{
    var resultingDuration =
        await showDurationPicker(
      context: context,
      initialTime:
      Duration(minutes: 30),
    );
    timeduration.value= formatMin(resultingDuration.toString());
    print(timeduration.value);
  }

  void selectAlarm(){
      alarm.value=!alarm.value;
      print('alarm ${alarm.value}');
  }

  void selectNotification(){
    notification.value=!notification.value;
    print('notification ${notification.value}');
  }

  void selectKPI(){
    kpi.value=!kpi.value;
    print('kpi ${kpi.value}');
  }

  void setColor1(String value){
    clickStatus1.value=!clickStatus1.value;
    prioritylevel1.value=value;
    print(prioritylevel1.value);

  }
  void setColor2(String value){
    clickStatus2.value=!clickStatus2.value;
    prioritylevel2.value=value;
    print(prioritylevel2.value);
  }


  void onSelected(String value) {
    print(value);
    dropdownValue.value = value;
    update();
  }

  void formatDate(String date){
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value=outputFormat.format(inputDate);
    print(timeDate.value);
  }


  String formatMin(String min){
    var inputFormat = DateFormat('HH:mm:ss.SSSSSS');
    var inputDate = inputFormat.parse(min);
    var outputFormat = DateFormat('HH:mm');
    return outputFormat.format(inputDate);

  }

  void onTimeChangedStart(TimeOfDay newTime) {
    timestart.value='${newTime.hour}:${newTime.minute}';
    print(timestart.value);
  }

  void onTimeChangedEnd(TimeOfDay newTime) {
    timeend.value='${newTime.hour}:${newTime.minute}';
    print(timestart.value);
  }

  bool iosStyle = true;



  void back(){
    Get.back();
  }
}