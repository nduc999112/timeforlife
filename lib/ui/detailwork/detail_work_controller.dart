import 'package:duration_picker/duration_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeforlife/ui/work/work_controller.dart';
import 'package:timeforlife/ui/work/work_view.dart';
import 'package:intl/intl.dart';

class DetailWorkController extends GetxController{

  User ?user;
  var dropdownValue = 'Theo ngày'.obs ;
  List<String> language = <String>['Hàng ngày', 'Theo ngày'];
  var dateOfWeek=''.obs;

  Work ?work;

  var tecNoiDungCongViec = TextEditingController();

  var timeDate=''.obs;
  var timestart='00:00'.obs;
  var timeend='00:00'.obs;
  var timeduration=''.obs;

  var clickStatus1 = false.obs;
  var clickStatus2 = false.obs;

  var prioritylevel1=''.obs;
  var prioritylevel2=''.obs;

  var alarm=false.obs;
  var notification=false.obs;
  var kpi=false.obs;

  Rx<dynamic> noiDungCongViec = Rxn();
  TimeOfDay time = TimeOfDay.now().replacing(minute: 30);
  var listDate=[
    'T2',
    'T3',
    'T4',
    'T5',
    'T6',
    'T7',
    'CN'
  ];

  final databaseRef=FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    work=Get.arguments['list'];
    user=Get.arguments['user'];
    timeDate.value=work!.dateTime!;
    noiDungCongViec.value=work!.contentWork;
    timestart.value=work!.startTime!;
    timeend.value=work!.endTime!;
    prioritylevel1.value=work!.priorityLevel1!;
    prioritylevel2.value=work!.priorityLevel2!;
    timeduration.value=work!.timeDuration!;
    alarm.value=work!.alarm!;
    notification.value=work!.notification!;
    kpi.value=work!.kpi!;
    getData();
  }

  void getData(){
    timestart.value=work!.startTime??'00:00';
    timeend.value=work!.endTime??'00:00';
    tecNoiDungCongViec.text=work!.contentWork??'';
    timeduration.value=work!.timeDuration??'';
    work!.priorityLevel1=='Quan trọng'?clickStatus1.value=true:clickStatus1.value=false;
    work!.priorityLevel1=='Không quan trọng'?clickStatus2.value=false:clickStatus2.value=true;
    var key=work!.key;
    print('details ${key}');
    print('check ${work!.contentWork}');
  }

  void selectTimeDate(String date){
    formatDate(date);
  }
  void formatDate(String date){
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value=outputFormat.format(inputDate);
    print(timeDate.value);
  }

  void onChange(){
    noiDungCongViec.value = tecNoiDungCongViec.value.text.toString().trim();
    print( noiDungCongViec.value);
  }

  void deleteData() async{
    //databaseRef
    // FirebaseDatabase.instance.reference().child("Work").orderByChild("nomPlace").equalTo("t").onChildRemoved;
    var key=work!.key;
    print('work ${work!.contentWork}');
   await databaseRef.child("Work").child(user!.uid).child(key!).remove().then((value) => Get.to(()=>WorkView()));

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

  void showdurationtime(BuildContext context) async{
    var resultingDuration =
    await showDurationPicker(
      context: context,
      initialTime:
      Duration(minutes: 30),
    );
    timeduration.value=resultingDuration.toString();
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

  void onTimeChangedEnd(TimeOfDay newTime) {

    timeend.value='${newTime.hour}:${newTime.minute}';
  }

  void onTimeChangedStart(TimeOfDay newTime) {

    timestart.value='${newTime.hour}:${newTime.minute}';
  }
  void onSelected(String value) {
    print(value);
    dropdownValue.value = value;
    // update();
  }
  void getDateOfWeek(String value){
    dateOfWeek.value=value;
    print('date of week ${dateOfWeek.value}');
  }

  void updateData() async{
    var key=work!.key;
   await databaseRef.child("Work").child(user!.uid).child(key!).update(
        {
          'id':user!.uid,
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
        }).then((value) => Get.snackbar("Thông báo", "Cập nhật công việc thành công"));
  }
  void back(){
    Get.back();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}