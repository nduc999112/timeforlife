import 'package:duration_picker/duration_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class AddWorkController extends GetxController {
  User? user;

  var listDate = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
  var list = [];
  var checkbool = false.obs;
  var prioritylevel1 = ''.obs;
  var prioritylevel2 = ''.obs;

  var dropdownValue = 'Theo ngày'.obs;

  var timestart = '00:00'.obs;
  var timeend = '00:00'.obs;
  var timeduration = ''.obs;

  var alarm = false.obs;
  var notification = false.obs;
  var kpi = false.obs;

  var timeDate = '${DateTime.now()}'.obs;

  var clickStatus1 = false.obs;
  var clickStatus2 = false.obs;

  var click = 0.obs;

  var dateOfWeek = ''.obs;

  var tecNoiDungCongViec = TextEditingController();

  Rx<dynamic> noiDungCongViec = Rxn();

  TimeOfDay time = TimeOfDay.now().replacing(minute: 30);
  var language = <String>['daily'.tr, 'Theo ngày'];

  List<String> mutil = [];

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    // TODO: implement onInit
    user = Get.arguments;
    selectTimeDate1();
    // getDayofWeek();
    print('reload');
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Color? check(String value) {
    Color? color;
    if (list.contains(value)) {
      color = Colors.grey;
    }
    if (list.contains(value) == false) {
      color = Colors.white;
    }
    return color;
  }

  dynamic getDayofWeek() {
    DateTime date = DateTime.now();
/*    var newDate = new DateTime(date.year, date.month, date.day);*/
    int day = date.weekday;
    print(list.length);
    var newDate;
    print("weekday is ${date.weekday}");
    switch (day) {
      case 1:
        print('thu 2');
        newDate = new DateTime(date.year, date.month, date.day);
        print(newDate);
        break;
      case 2:
        print('thu 3');
        newDate = new DateTime(date.year, date.month, date.day - 1);
        print(newDate);
        break;
      case 3:
        print('thu 4');
        newDate = new DateTime(date.year, date.month, date.day - 2);
        print(newDate);
        break;
      case 4:
        print('thu 5');
        newDate = new DateTime(date.year, date.month, date.day - 3);
        print(newDate);
        break;
      case 5:
        print('thu 6');
        newDate = new DateTime(date.year, date.month, date.day - 4);
        print(newDate);
        break;
      case 6:
        print('thu 7');
        newDate = new DateTime(date.year, date.month, date.day - 5);
        print(newDate);
        break;
      case 7:
        print('chu nhat');
        var newDate = new DateTime(date.year, date.month, date.day - 6);
        print(newDate);
        break;
    }
    return newDate;
  }

  void toWorkView() {
    WorkController workController = Get.find();
    workController.onInit();
    Get.back();
  }

  void selectTimeDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value = outputFormat.format(inputDate);
    print(timeDate.value);
  }

  void selectTimeDate1() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse('${DateTime.now()}');
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value = outputFormat.format(inputDate);
    print(timeDate.value);
  }

  void getDateOfWeek(int value) {
    // dateOfWeek.value=value;
    print('date of week ${value + 1}');
    click.value = value;
  }

  void insertData() async {
    if(dropdownValue=='Hàng ngày') {
      var date = getDayofWeek();
      print('check $date');
      for (int i = 0; i < list.length; i++) {
        if (list[i] == 'T2') {
          print('insert t2');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'T3') {
          print('insert t3');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 1);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'T4') {
          print('insert t4');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 2);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'T5') {
          print('insert t5');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 3);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'T6') {
          print('insert t5');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 4);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'T7') {
          print('insert t5');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 5);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
        if (list[i] == 'CN') {
          print('insert t5');
          var key = user!.uid.toString();
          int j = 0;
          for (int i = 0; i < 10; i++) {
            var newDate = new DateTime(date.year, date.month, date.day + j + 6);
            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            var inputDate = inputFormat.parse(newDate.toString());
            var outputFormat = DateFormat('dd/MM/yyyy');
            String dateformat = outputFormat.format(inputDate);
            await databaseRef.child('Work').child(key).push().set({
              'id': user!.uid,
              'Status': false,
              'DateTime': dateformat,
              'ContentWork': noiDungCongViec.value,
              'StartTime': timestart.value,
              'EndTime': timeend.value,
              'PriorityLevel1': prioritylevel1.value,
              'PriorityLevel2': prioritylevel2.value,
              'TimeDuration': timeduration.value,
              'alarm': alarm.value,
              'notification': notification.value,
              'kpi': kpi.value
            }).catchError((onError) {
              print('error $onError');
            });
            j += 7;
            print('check week $j');
          }
        }
      }
    }
    if(dropdownValue=='Theo ngày'){
      DateTime startDate = new DateFormat("HH:mm").parse(timestart.value);
      DateTime endDate = new DateFormat("HH:mm").parse(timeend.value);
      if(endDate.isBefore(startDate)){
        Get.snackbar('Thông báo','Thời gian kết thúc không được nhỏ hơn thời gian bắt đầu');
      }
      else{
        var key = user!.uid.toString();
        await databaseRef.child('Work').child(key).push().set({
          'id': user!.uid,
          'Status': false,
          'DateTime': timeDate.value,
          'ContentWork': noiDungCongViec.value,
          'StartTime': timestart.value,
          'EndTime': timeend.value,
          'PriorityLevel1': prioritylevel1.value,
          'PriorityLevel2': prioritylevel2.value,
          'TimeDuration': timeduration.value,
          'alarm': alarm.value,
          'notification': notification.value,
          'kpi': kpi.value
        }).catchError((onError) {
          print('error $onError');
        });
      }

    }

  }

  void onChange() {
    noiDungCongViec.value = tecNoiDungCongViec.value.text.toString().trim();
    print(noiDungCongViec.value);
  }

  void showdurationtime(BuildContext context) async {
    var resultingDuration = await showDurationPicker(
      context: context,
      initialTime: Duration(minutes: 30),
    );
    timeduration.value = formatMin(resultingDuration.toString());
    print(timeduration.value);
  }

  void selectAlarm() {
    alarm.value = !alarm.value;
    print('alarm ${alarm.value}');
  }

  void selectNotification() {
    notification.value = !notification.value;
    print('notification ${notification.value}');
  }

  void selectKPI() {
    kpi.value = !kpi.value;
    print('kpi ${kpi.value}');
  }

  void setColor1(String value) {
    clickStatus1.value = !clickStatus1.value;
    prioritylevel1.value = value;
    print(prioritylevel1.value);
  }

  void setColor2(String value) {
    clickStatus2.value = !clickStatus2.value;
    prioritylevel2.value = value;
    print(prioritylevel2.value);
  }

  void onSelected(String value) {
    print(value);
    dropdownValue.value = value;
    update();
  }

  void formatDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    timeDate.value = outputFormat.format(inputDate);
    print(timeDate.value);
  }

  String formatMin(String min) {
    var inputFormat = DateFormat('HH:mm:ss.SSSSSS');
    var inputDate = inputFormat.parse(min);
    var outputFormat = DateFormat('HH:mm');
    return outputFormat.format(inputDate);
  }

  void onTimeChangedStart(TimeOfDay newTime) {
    timestart.value = '${newTime.hour}:${newTime.minute}';
    print(timestart.value);
  }

  void onTimeChangedEnd(TimeOfDay newTime) {
    timeend.value = '${newTime.hour}:${newTime.minute}';
    print(timeend.value);
  }

  bool iosStyle = true;

  void back() {
    Get.back();
  }
}
