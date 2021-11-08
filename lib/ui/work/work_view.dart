import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';
import 'work_controller.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class WorkView extends GetWidget<WorkController> {
  final  _controller = Get.lazyPut(() => WorkController());
  var query = FirebaseDatabase.instance.reference().child("Work").orderByChild("DateTime").equalTo("");
  @override
  Widget build(BuildContext context) {
    return
      Stack(
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
              body: Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg/800px-Oleksandr_Usyk_training_-_20150409_-_24_%28cut%29.jpg')
                              ),
                              Utils.getSpaceView(SizeConst.w10, 0),
                              Text('${controller.user!.email}',
                                  style: TextStyle(
                                    fontSize: SizeConst.size14,
                                    color: ColorConstant.white,
                                  )),
                            ],
                          ),
                          IconButton(
                            icon: Image.asset('assets/images/add.png'),
                            iconSize: 50,
                            onPressed: () {
                              controller.addWork();
                            },
                          )
                        ],
                      ),
                    ),
                    Obx(()=>
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                      '${controller.timeDate}',
                      style: TextStyle(
                            fontSize: SizeConst.size23,
                            color: ColorConstant.white,
                            fontWeight: FontWeight.bold),
                    ),
                        ),),
                    Column(
                      children: <Widget>[
                        CalendarTimeline(
                          showYears: false,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2019, 1, 15),
                          lastDate: DateTime(2025, 11, 20),
                          onDateSelected: (date) {
                            controller.selectTimeDate(date.toString());
                            controller.getWork();
                          },

                          leftMargin: 50,
                          monthColor: Colors.white,
                          dayColor: Colors.white,
                          activeDayColor: Colors.blueAccent,
                          activeBackgroundDayColor: Colors.white,
                          dotsColor: Color(0xFF333A47),
                          selectableDayPredicate: (date) => date.day != 23,
                          locale: 'vi',
                        )
                      ],
                    ),
                    Expanded(
                      child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          // FirebaseAnimatedList(
                          //     query: FirebaseDatabase.instance.reference().child('Work').child('${controller.user!.uid}'),
                          //     padding: new EdgeInsets.all(8.0),
                          //     reverse: false,
                          //     itemBuilder: (_, DataSnapshot snapshot,
                          //         Animation<double> animation, int x) {
                          //       print(snapshot.value.toString());
                          //       return InkWell(
                          //         onTap: () => controller.toDetail(),
                          //         child: Container(
                          //             margin: EdgeInsets.only(right: 10, bottom: 40),
                          //             child:
                          //             Utils.customTimeline(
                          //                 title: "${snapshot.value['ContentWork']}",
                          //                 timetitle: "${snapshot.value['DateTime']}",
                          //                 colorStatus: controller.colorcompare(snapshot.value['PriorityLevel1'],snapshot.value['PriorityLevel2']),
                          //                 coloricon: ColorConstant.blue2,
                          //                 coloralert: snapshot.value['alarm']?ColorConstant.alert:null,
                          //                 colorkpi: snapshot.value['kpi']?ColorConstant.kpi:null,
                          //                 colorring: snapshot.value['notification']?ColorConstant.ringing:null,
                          //             ),
                          //
                          //             ),
                          //       );
                          //     }),
                        // ),

                       Obx(()=>
                          controller.list!=null? ListView.builder(
                              itemCount: controller.list.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.toDetail(index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: SizeConst.h20),
                                    child: Utils.customTimeline(
                                      update: (){
                                        controller.updateStatus(index);
                                      },
                                      title: "${controller.list[index].contentWork}",
                                      timetitle: "${controller.list[index].startTime} - ${controller.list[index].endTime}",
                                      colorStatus: controller.colorcompare(controller.list[index].priorityLevel1??'',controller.list[index].priorityLevel2??''),
                                      coloricon: controller.list[index].status==true?ColorConstant.blue2:Colors.grey,
                                      coloralert: controller.list[index].alarm==true?ColorConstant.alert:null,
                                      colorkpi: controller.list[index].kpi==true?ColorConstant.kpi:null,
                                      colorring: controller.list[index].notification==true?ColorConstant.ringing:null,
                                      statusbutton: controller.list[index].status==true?false:true,
                                    ),
                                  ),
                                );
                              }):Container()
                         )
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],


      );
  }
}
