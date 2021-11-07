import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeforlife/NotificationApi.dart';
import 'package:timeforlife/ui/work/work_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../NotificationApi.dart';
class NotificationController extends GetxController {
  RxList<Work> listnotification = RxList<Work>();
  User ?user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // var format = DateFormat("HH:mm");
    // var one = format.parse("10:40");
    // var two = format.parse("18:20");
    // var data=format.parse('${two.difference(one)}');
    // print('ok $data');
    NotificationService().showNotification(1,'ok','ok',1);
    WorkController workController=Get.find();
    user=workController.user;
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void notification(){

  }
  void getData() async {
    //addValueEventListener
    var date = DateTime.now();

    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var formatHours = DateFormat('HH:mm:SS.ssssss');

    var inputDate = inputFormat.parse(date.toString());

    var outputFormat = DateFormat('dd/MM/yyyy').format(inputDate);
    listnotification.clear();
    await FirebaseDatabase.instance.reference().child("Work").child(user!.uid).orderByChild('DateTime').equalTo(outputFormat).once()
        .then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.exists){
        var keys = dataSnapshot.value.keys;
        var values = dataSnapshot.value;
        for (var key in keys) {
          Work work = new Work(
            key: key,
            contentWork: values [key]['ContentWork'],
            dateTime: values [key]['DateTime'],
            endTime: values [key]['EndTime'],
            priorityLevel1: values [key]['PriorityLevel1'],
            priorityLevel2: values [key]['PriorityLevel2'],
            startTime: values [key]['StartTime'],
            timeDuration: values [key]['TimeDuration'],
            alarm: values [key]['alarm'],
            id: values [key]['id'],
            kpi: values [key]['kpi'],
            notification: values [key]['notification'],
          ); // print('check key ${work.key}');
          var inputFormatHous = DateFormat('HH:mm');
          var outputFormat1 = DateFormat('HH').format(inputDate);
          var outputFormat2=DateFormat('mm').format(inputDate);

          var inputDate1 = inputFormatHous.parse(work.endTime!);
          var endtime=DateFormat('HH').format(inputDate1);
          var endtime1=DateFormat('mm').format(inputDate1);

          var inputDuration= inputFormatHous.parse(work.timeDuration!);

          int duration=int.parse(DateFormat('mm').format(inputDuration));

          if(outputFormat1==endtime){
            print('check durationo $endtime1 $outputFormat2');
            int check=int.parse(endtime1)-int.parse(outputFormat2);
            print('check ${check}');
            print('du ${duration}');
            if(duration>=check){
              print('báo thức');
              listnotification.add(work);
            }
          }
        }
      }else{
        print('no data');
      }
    });
  }

}
