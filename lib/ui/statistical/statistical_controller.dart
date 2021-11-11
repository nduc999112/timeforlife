import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class StatisticalController extends GetxController {
  var dateTime = '${DateTime.now()}'.obs;
  var dateMonth = '${DateTime.now()}'.obs;
  var dateyear = '${DateTime.now()}'.obs;

  User? userdata;

  var totalWork = 0.obs;
  var totalcomplete = 0.obs;
  var totalfails = 0.obs;

  var status1 = 0.obs;
  var status2 = 0.obs;
  var status3 = 0.obs;
  var status4 = 0.obs;
  var status5 = 0.obs;

  var week1 = 0.obs;
  var week2 = 0.obs;
  var week3 = 0.obs;
  var week4 = 0.obs;

  var poinweek1 = 0.obs;
  var totalcplweek1 = 0.obs;
  var totalfailweek1 = 0.obs;

  var poinweek2 = 0.obs;
  var totalcplweek2 = 0.obs;
  var totalfailweek2 = 0.obs;

  var poinweek3 = 0.obs;
  var totalcplweek3 = 0.obs;
  var totalfailweek3 = 0.obs;

  var poinweek4 = 0.obs;
  var totalcplweek4 = 0.obs;
  var totalfailweek4 = 0.obs;

  //thong ke year
  var month1=0.obs;
  var month2=0.obs;
  var month3=0.obs;
  var month4=0.obs;
  var month5=0.obs;
  var month6=0.obs;
  var month7=0.obs;
  var month8=0.obs;
  var month9=0.obs;
  var month10=0.obs;
  var month11=0.obs;
  var month12=0.obs;

  var kpiyearm1=0.obs;
  var workcompltem1=0.obs;
  var workfailm1=0.obs;

  var kpiyearm2=0.obs;
  var workcompltem2=0.obs;
  var workfailm2=0.obs;

  var kpiyearm3=0.obs;
  var workcompltem3=0.obs;
  var workfailm3=0.obs;

  var kpiyearm4=0.obs;
  var workcompltem4=0.obs;
  var workfailm4=0.obs;

  var kpiyearm5=0.obs;
  var workcompltem5=0.obs;
  var workfailm5=0.obs;

  var kpiyearm6=0.obs;
  var workcompltem6=0.obs;
  var workfailm6=0.obs;

  var kpiyearm7=0.obs;
  var workcompltem7=0.obs;
  var workfailm7=0.obs;

  var kpiyearm8=0.obs;
  var workcompltem8=0.obs;
  var workfailm8=0.obs;

  var kpiyearm9=0.obs;
  var workcompltem9=0.obs;
  var workfailm9=0.obs;

  var kpiyearm10=0.obs;
  var workcompltem10=0.obs;
  var workfailm10=0.obs;

  var kpiyearm11=0.obs;
  var workcompltem11=0.obs;
  var workfailm11=0.obs;

  var kpiyearm12=0.obs;
  var workcompltem12=0.obs;
  var workfailm12=0.obs;

  var totalmonth=0.obs;
  var totalmonthkpi=0.obs;

  var totalyear=0.obs;
  var totalyearkpi=0.obs;
  //
  // final List<SalesData> chartData1 = [
  //   SalesData(2010 , 35),
  //   SalesData(2010, 28),
  //   SalesData(2010 , 34),
  //   SalesData(2010 , 32),
  //   SalesData(2010 , 40)
  // ];
  RxList<ChartData> chartData = RxList<ChartData>();
  RxList<Work> listComplete = RxList<Work>();
  RxList<Work> listfail = RxList<Work>();

  // List<ChartData> chartData=[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WorkController workController = Get.find();
    userdata = workController.user;
    print(userdata!.uid);
    getTotalWork();
    getTotalStatusComplete();
    getTotalMonth();
    getTotalYear();
    print('reload');
    // getTotalStatusNotComplete();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getTotalWork() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Work")
        .child(userdata!.uid)
        .orderByChild("DateTime")
        .equalTo(formatDate())
        .once()
        .then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.exists){
        var data = dataSnapshot.value.keys;
        var total = [];
        data.forEach((v) => total.add(v));
        print('length total ${total.length }');
        totalWork.value = total.length ;
      }
      else{
        totalWork.value=0;
      }
    });
  }

  void getTotalStatusComplete() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Work")
        .child(userdata!.uid)
        .orderByChild("DateTime")
        .equalTo(formatDate())
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.exists) {
        var keys = dataSnapshot.value.keys;
        var values = dataSnapshot.value;
        print(dataSnapshot.value);
        totalcomplete.value = 0;
        totalfails.value = 0;
        status1.value = 0;
        status2.value = 0;
        status3.value = 0;
        status4.value = 0;
        status5.value = 0;

        listComplete.clear();
        listfail.clear();
        chartData.clear();
        for (var key in keys) {
          Work work = new Work(
            key: key,
            status: values[key]['Status'],
            contentWork: values[key]['ContentWork'],
            dateTime: values[key]['DateTime'],
            endTime: values[key]['EndTime'],
            priorityLevel1: values[key]['PriorityLevel1'],
            priorityLevel2: values[key]['PriorityLevel2'],
            startTime: values[key]['StartTime'],
            timeDuration: values[key]['TimeDuration'],
            alarm: values[key]['alarm'],
            id: values[key]['id'],
            kpi: values[key]['kpi'],
            notification: values[key]['notification'],
          );
          if (work.status == true) {
            totalcomplete++;
            listComplete.add(work);
          }
          if (work.status == false) {
            totalfails++;
            listfail.add(work);
          }

          if (work.priorityLevel1 == 'Không quan trọng' &&
              work.priorityLevel2 == 'Khẩn cấp') {
            status1++;
          }
          if (work.priorityLevel1 == 'Không quan trọng' &&
              work.priorityLevel2 == 'Không khẩn cấp') {
            status2++;
          }
          if (work.priorityLevel1 == 'Quan trọng' &&
              work.priorityLevel2 == 'Không khẩn cấp') {
            status3++;
          }
          if (work.priorityLevel1 == 'Quan trọng' &&
              work.priorityLevel2 == 'Khẩn cấp') {
            status4++;
          }
        }
        chartData.addAll([
          ChartData('David', status1.value.toDouble(),
              color: ColorConstant.char1),
          ChartData('Steve', status2.value.toDouble(),
              color: ColorConstant.char2),
          ChartData('Jack', status3.value.toDouble(),
              color: ColorConstant.char3),
          ChartData('Others', status4.value.toDouble(),
              color: ColorConstant.char4),
          ChartData('Others', status5.value.toDouble(),
              color: ColorConstant.char5)
        ]);
        print('check complete ${totalcomplete}');
        print('check fail ${totalfails}');
        print('check status ${status1} , ${status2} , ${status3} , ${status4}');
      } else {
        totalcomplete.value = 0;
        totalfails.value = 0;
        status1.value = 0;
        status2.value = 0;
        status3.value = 0;
        status4.value = 0;
        status5.value = 0;
        listComplete.clear();
        listfail.clear();
        chartData.clear();
        chartData.addAll([
          ChartData('David', 0,
              color: ColorConstant.char1),
          ChartData('Steve', 0,
              color: ColorConstant.char2),
          ChartData('Jack', 0,
              color: ColorConstant.char3),
          ChartData('Others', 0,
              color: ColorConstant.char4),
          ChartData('Others', 0,
              color: ColorConstant.char5)
        ]);
      }
    });
  }

  void getTotalStatusNotComplete() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Work")
        .child(userdata!.uid)
        .orderByChild("DateTime")
        .equalTo(formatDate())
        .once()
        .then((DataSnapshot dataSnapshot) {
      var data = dataSnapshot.value.keys;
      var total = [];
      data.forEach((v) => total.add(v));
      print('length fail ${total.length}');
    });
  }

  void getTotalMonth() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Work")
        .child(userdata!.uid)
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.exists) {
        var keys = dataSnapshot.value.keys;
        var values = dataSnapshot.value;
        print(dataSnapshot.value);
        week1.value = 0;
        week2.value = 0;
        week3.value = 0;
        week4.value = 0;

        poinweek1.value = 0;
        totalcplweek1.value = 0;
        totalfailweek1.value = 0;

        poinweek2.value = 0;
        totalcplweek2.value = 0;
        totalfailweek2.value = 0;

        poinweek3.value = 0;
        totalcplweek3.value = 0;
        totalfailweek3.value = 0;

        poinweek4.value = 0;
        totalcplweek4.value = 0;
        totalfailweek4.value = 0;

        totalmonth.value=0;
        totalmonthkpi.value=0;
        for (var key in keys) {
          Work work = new Work(
            key: key,
            status: values[key]['Status'],
            contentWork: values[key]['ContentWork'],
            dateTime: values[key]['DateTime'],
            endTime: values[key]['EndTime'],
            priorityLevel1: values[key]['PriorityLevel1'],
            priorityLevel2: values[key]['PriorityLevel2'],
            startTime: values[key]['StartTime'],
            timeDuration: values[key]['TimeDuration'],
            alarm: values[key]['alarm'],
            id: values[key]['id'],
            kpi: values[key]['kpi'],
            notification: values[key]['notification'],
          );
          var datetime = work.dateTime;
          if(datetime!=null){
          String yeardata = formarYearData(datetime);
          String yearinput = formarYearInput();

          String monthdata = formarMonthData(datetime);
          String monthinput = formarMonthInput();

          String datedata = formarDateData(datetime);
          // String dateinput=formarMonthInput();

          print('check datedata $datedata ');
          int dateint = int.parse(datedata);
          if (yeardata == yearinput) {
            if (monthdata == monthinput) {
              if (dateint < 7) {
                week1++;
                if (work.kpi == true) {
                  poinweek1.value++;
                }
                if(work.status==true){
                  totalcplweek1.value++;
                }
                if(work.status==false){
                  totalfailweek1.value++;
                }

              } else if (dateint < 14) {
                week2++;
                if (work.kpi == true) {
                  poinweek2.value++;
                }
                if(work.status==true){
                  totalcplweek2.value++;
                }
                if(work.status==false){
                  totalfailweek2.value++;
                }

              } else if (dateint < 21) {
                if (work.kpi == true) {
                  poinweek3.value++;
                }
                if(work.status==true){
                  totalcplweek3.value++;
                }
                if(work.status==false){
                  totalfailweek3.value++;
                }

              } else {
                week4++;
                if (work.kpi == true) {
                  poinweek4.value++;
                }
                if(work.status==true){
                  totalcplweek4.value++;
                }
                if(work.status==false){
                  totalfailweek4.value++;
                }

              }
              totalmonth.value=week1.value+week2.value+week3.value+week4.value;
              totalmonthkpi.value=totalcplweek1.value+totalcplweek2.value+totalcplweek3.value+totalcplweek4.value;
              print('check total kpi ${totalmonthkpi}');
            }
          }

          print('check week $week1 $week2 $week3 $week4');
        }}
      } else {
        week1.value = 0;
        week2.value = 0;
        week3.value = 0;
        week4.value = 0;

        poinweek1.value = 0;
        totalcplweek1.value = 0;
        totalfailweek1.value = 0;

        poinweek2.value = 0;
        totalcplweek2.value = 0;
        totalfailweek2.value = 0;

        poinweek3.value = 0;
        totalcplweek3.value = 0;
        totalfailweek3.value = 0;

        poinweek4.value = 0;
        totalcplweek4.value = 0;
        totalfailweek4.value = 0;

        totalmonth.value=0;
        totalmonthkpi.value=0;
      }
    });
  }

  void getTotalYear() async{
    await FirebaseDatabase.instance
        .reference()
        .child("Work")
        .child(userdata!.uid)
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.exists) {
        month1.value = 0;
        month2.value = 0;
        month3.value = 0;
        month4.value = 0;
        month5.value = 0;
        month6.value = 0;
        month7.value = 0;
        month8.value = 0;
        month9.value = 0;
        month10.value = 0;
        month11.value = 0;
        month12.value = 0;

         kpiyearm1.value=0;
         workcompltem1.value=0;
         workfailm1.value=0;

        kpiyearm2.value=0;
        workcompltem2.value=0;
        workfailm2.value=0;

        kpiyearm3.value=0;
        workcompltem3.value=0;
        workfailm3.value=0;

        kpiyearm4.value=0;
        workcompltem4.value=0;
        workfailm4.value=0;

        kpiyearm5.value=0;
        workcompltem5.value=0;
        workfailm5.value=0;

        kpiyearm6.value=0;
        workcompltem6.value=0;
        workfailm6.value=0;

        kpiyearm7.value=0;
        workcompltem7.value=0;
        workfailm7.value=0;

        kpiyearm8.value=0;
        workcompltem8.value=0;
        workfailm8.value=0;

        kpiyearm9.value=0;
        workcompltem9.value=0;
        workfailm9.value=0;

        kpiyearm10.value=0;
        workcompltem10.value=0;
        workfailm10.value=0;

        kpiyearm11.value=0;
        workcompltem11.value=0;
        workfailm11.value=0;

        kpiyearm12.value=0;
        workcompltem12.value=0;
        workfailm12.value=0;

        totalyear.value=0;
        totalyearkpi.value=0;
        var keys = dataSnapshot.value.keys;
        var values = dataSnapshot.value;
        print(dataSnapshot.value);
        for (var key in keys) {
          Work work = new Work(
            key: key,
            status: values[key]['Status'],
            contentWork: values[key]['ContentWork'],
            dateTime: values[key]['DateTime'],
            endTime: values[key]['EndTime'],
            priorityLevel1: values[key]['PriorityLevel1'],
            priorityLevel2: values[key]['PriorityLevel2'],
            startTime: values[key]['StartTime'],
            timeDuration: values[key]['TimeDuration'],
            alarm: values[key]['alarm'],
            id: values[key]['id'],
            kpi: values[key]['kpi'],
            notification: values[key]['notification'],
          );
          var datetime = work.dateTime;

          if(datetime!=null){
            String yeardata = formarYearData(datetime);
            String yearinput = formarYearInput();
            String monthdata = formarMonthData(datetime);

            print('year data ${yeardata} và yearinput $yearinput');
            if (yeardata == yearinput) {
              if(int.parse(monthdata)==01){
                month1++;
                if(work.kpi==true){
                  kpiyearm1++;
                }
                if(work.kpi==false){
                  workfailm1++;
                }
                if(work.status==true){
                  workcompltem1++;
                }
              }
              if(int.parse(monthdata)==02){
                month2++;
                if(work.kpi==true){
                  kpiyearm2++;
                }
                if(work.kpi==false){
                  workfailm2++;
                }
                if(work.status==true){
                  workcompltem2++;
                }
              }
              if(int.parse(monthdata)==03){
                month3++;
                if(work.kpi==true){
                  kpiyearm3++;
                }
                if(work.kpi==false){
                  workfailm3++;
                }
                if(work.status==true){
                  workcompltem3++;
                }
              }
              if(int.parse(monthdata)==04){
                month4++;
                if(work.kpi==true){
                  kpiyearm4++;
                }
                if(work.kpi==false){
                  workfailm4++;
                }
                if(work.status==true){
                  workcompltem4++;
                }
              }
              if(int.parse(monthdata)==05){
                month5++;
                if(work.kpi==true){
                  kpiyearm5++;
                }
                if(work.kpi==false){
                  workfailm5++;
                }
                if(work.status==true){
                  workcompltem5++;
                }
              }
              if(int.parse(monthdata)==06){
                month6++;
                if(work.kpi==true){
                  kpiyearm6++;
                }
                if(work.kpi==false){
                  workfailm6++;
                }
                if(work.status==true){
                  workcompltem6++;
                }
              }
              if(int.parse(monthdata)==07){
                month7++;
                if(work.kpi==true){
                  kpiyearm7++;
                }
                if(work.kpi==false){
                  workfailm7++;
                }
                if(work.status==true){
                  workcompltem7++;
                }
              }
              if(int.parse(monthdata)==08){
                month8++;
                if(work.kpi==true){
                  kpiyearm8++;
                }
                if(work.kpi==false){
                  workfailm8++;
                }
                if(work.status==true){
                  workcompltem8++;
                }
              }
              if(int.parse(monthdata)==09){
                month9++;
                if(work.kpi==true){
                  kpiyearm9++;
                }
                if(work.kpi==false){
                  workfailm9++;
                }
                if(work.status==true){
                  workcompltem9++;
                }
              }
              if(int.parse(monthdata)==10){
                month10++;
                if(work.kpi==true){
                  kpiyearm10++;
                }
                if(work.kpi==false){
                  workfailm10++;
                }
                if(work.status==true){
                  workcompltem10++;
                }
              }
              if(int.parse(monthdata)==11){
                month11++;
                if(work.kpi==true){
                  kpiyearm11++;
                }
                if(work.kpi==false){
                  workfailm11++;
                }
                if(work.status==true){
                  workcompltem11++;
                }
              }
              if(int.parse(monthdata)==12){
                month12++;
                if(work.kpi==true){
                  kpiyearm12++;
                }
                if(work.kpi==false){
                  workfailm12++;
                }
                if(work.status==true){
                  workcompltem12++;
                }
              }

              totalyear.value=month1.value+month2.value+month3.value+month4.value+month5.value+month6.value+month7.value+month8.value+month9.value+month10.value+month11.value+month12.value;
              totalyearkpi.value= workcompltem1.value+workcompltem2.value+workcompltem3.value+workcompltem4.value+workcompltem5.value+workcompltem6.value+workcompltem7.value+workcompltem8.value+workcompltem9.value+workcompltem10.value+workcompltem11.value+workcompltem12.value;
            }
            else {
              print('no data year');
              month1.value = 0;
              month2.value = 0;
              month3.value = 0;
              month4.value = 0;
              month5.value = 0;
              month6.value = 0;
              month7.value = 0;
              month8.value = 0;
              month9.value = 0;
              month10.value = 0;
              month11.value = 0;
              month12.value = 0;

              kpiyearm1.value=0;
              workcompltem1.value=0;
              workfailm1.value=0;

              kpiyearm2.value=0;
              workcompltem2.value=0;
              workfailm2.value=0;

              kpiyearm3.value=0;
              workcompltem3.value=0;
              workfailm3.value=0;

              kpiyearm4.value=0;
              workcompltem4.value=0;
              workfailm4.value=0;

              kpiyearm5.value=0;
              workcompltem5.value=0;
              workfailm5.value=0;

              kpiyearm6.value=0;
              workcompltem6.value=0;
              workfailm6.value=0;

              kpiyearm7.value=0;
              workcompltem7.value=0;
              workfailm7.value=0;

              kpiyearm8.value=0;
              workcompltem8.value=0;
              workfailm8.value=0;

              kpiyearm9.value=0;
              workcompltem9.value=0;
              workfailm9.value=0;

              kpiyearm10.value=0;
              workcompltem10.value=0;
              workfailm10.value=0;

              kpiyearm11.value=0;
              workcompltem11.value=0;
              workfailm11.value=0;

              kpiyearm12.value=0;
              workcompltem12.value=0;
              workfailm12.value=0;

              totalyear.value=0;
              totalyearkpi.value=0;
            }
          }
        }
      } else{

      }
    });
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    dateTime.value = selected.toString();
    onInit();

  }

  Future<void> pickMonth(BuildContext context) async {
    showMonthPicker(
            context: context,
            firstDate: DateTime(DateTime.now().year - 1, 5),
            lastDate: DateTime(DateTime.now().year + 1, 9),
            initialDate: DateTime.now(),
            locale: Locale("vi"))
        .then((value) {dateMonth.value = value.toString();
    onInit();
    });

  }

  Future<void> picYear(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
              // Need to use container to add size constraint.
              width: 300,
              height: 300,
              child: YearPicker(
                firstDate: DateTime(DateTime.now().year - 100, 1),
                lastDate: DateTime(DateTime.now().year + 100, 1),
                initialDate: DateTime.now(),
                selectedDate: DateTime.now(),
                onChanged: (DateTime dateTime) {
                  dateyear.value = dateTime.toString();
                  print('check year${dateyear.value}');
                  Navigator.pop(context);
                },
              )),

        );

      },
    ).then((value) {

      getTotalYear();
      onInit();

    });
    // showMonthPicker(
    //     context: context,
    //     firstDate: DateTime(DateTime.now().year - 1, 5),
    //     lastDate: DateTime(DateTime.now().year + 1, 9),
    //     initialDate: DateTime.now(),
    //     locale: Locale("vi"),
    //
    // ).then((value) => dateMonth.value=value.toString());
  }

  String formatDate() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(dateTime.value);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  String formarMonth() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(dateMonth.value);
    var outputFormat = DateFormat('MM/yyyy');
    return outputFormat.format(inputDate);
  }

  String formarMonthInput() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(dateMonth.value);
    var outputFormat = DateFormat('MM');
    return outputFormat.format(inputDate);
  }

  String formarMonthData(String datetime) {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(datetime);
    var outputFormat = DateFormat('MM');
    return outputFormat.format(inputDate);
  }

  String formarDateInput() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(dateMonth.value);
    var outputFormat = DateFormat('dd');
    return outputFormat.format(inputDate);
  }

  String formarDateData(String datetime) {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(datetime);
    var outputFormat = DateFormat('dd');
    return outputFormat.format(inputDate);
  }

  String formarYearData(String month) {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(month);
    var outputFormat = DateFormat('yyyy');
    print('data formatyeardata ${outputFormat.format(inputDate)}');
    return outputFormat.format(inputDate);
  }

  String formarYearInput() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(dateyear.value);
    var outputFormat = DateFormat('yyyy');
    print(outputFormat.format(inputDate));
    return outputFormat.format(inputDate);
  }

  String formatYear() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(dateyear.value);
    var outputFormat = DateFormat('yyyy');
    // print(outputFormat.format(inputDate));
    return outputFormat.format(inputDate);
  }
}

class ChartData {
  ChartData(this.x, this.y, {required this.color});

  final String x;
  final double y;
  final Color color;
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
