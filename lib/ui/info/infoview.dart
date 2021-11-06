import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/color_constant.dart';
import 'package:timeforlife/commons/constant/size_const.dart';
import 'package:timeforlife/commons/utils/utils.dart';

import 'infocontroller.dart';

class InfoView extends GetWidget<InfoController> {
  final  _controller = Get.lazyPut(() => InfoController());

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
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: SizeConst.h20),
                child:Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/backicon.png'),
                          iconSize: 50,
                          onPressed: () {},
                        ),
                        Text(
                          'Giới thiệu',
                          style: TextStyle(
                              fontSize: SizeConst.size20,
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      height: 900,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 60,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: SizeConst.h320,
                                width: SizeConst.w364,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.blueAccent)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 22,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 10,
                            child: Container(
                              height: SizeConst.h55,
                              width: SizeConst.w170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Center(
                                child: Text(
                                  'TIME FOR LINE',
                                  style: TextStyle(
                                      fontSize: SizeConst.size18,
                                      color: ColorConstant.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 100,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: SizeConst.h320,
                                width: SizeConst.w364,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.blueAccent)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 22,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Time For Life',
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                                          children: const <TextSpan>[
                                            TextSpan(text: ' là ứng dụng hỗ trợ quản lý công '
                                                'việc cá nhân theo phương pháp ma trận Eise hay '
                                                'còn gọi là Eise box. Phương pháp này chi công '
                                                'việc của bạn thành 4 mức độ ưu tiên khác nhau.', style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14),)

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 400,
                            left: 10,
                            child: Container(
                              height: SizeConst.h55,
                              width: SizeConst.w170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Center(
                                child: Text(
                                  'VỀ CHÚNG TÔI',
                                  style: TextStyle(
                                      fontSize: SizeConst.size18,
                                      color: ColorConstant.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 100,
                            child: InkWell(
                              onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => Dialog(
                                          insetPadding: EdgeInsets.all(30),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Đánh giá ứng dụng',style: TextStyle(
                                                    fontSize: SizeConst.size22, color: ColorConstant.black,fontWeight: FontWeight.bold)),
                                                Utils.getSpaceView(0, SizeConst.h20),
                                                Text('Đánh giá trải nghiệm ứng dụng Time For Life của bạn ?',style:  TextStyle(
                                                    fontSize: SizeConst.size16, color: ColorConstant.black,fontWeight: FontWeight.normal),),
                                                Utils.getSpaceView(0, SizeConst.h20),
                                                RatingBar.builder(
                                                  itemSize: 30.0,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    controller.selectrating(rating);
                                                  },
                                                ),
                                                Utils.getSpaceView(0, SizeConst.h20),
                                                InkWell(

                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant.colorthu,
                                                      border: Border.all(color: Colors.grey),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 45),
                                                      child: Text('Gửi đánh giá',style:  TextStyle(
                                                          fontSize: SizeConst.size16, color: ColorConstant.white,fontWeight: FontWeight.bold),),
                                                    ),
                                                  ),
                                                  onTap: (){
                                                    controller.ratinginsert();
                                                    // controller.deleteData();
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),);
                              },
                              child: Column(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 30.0,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        Center(child: Text('Gửi đánh giá'),)
                                      ],
                                    ),
                                  )
                          )
                        ],
                      ),
                    ),






                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Stack(
                    //         children: [
                    //           Container(
                    //             height: 100,
                    //             width: 200,
                    //             decoration: BoxDecoration(color: Colors.white,boxShadow: [
                    //               BoxShadow(color: Colors.grey,blurRadius: 10,spreadRadius: 1)
                    //             ]),
                    //             child: Text('TIME FOR LINE'),
                    //           ),
                    //           Container(
                    //             height: 300,
                    //             width: 300,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(color: Colors.blueAccent)
                    //             ),
                    //             child: Text(
                    //               'Time For Life là ứng dụng hỗ trợ quản lý công '
                    //                   'việc cá nhân theo phương pháp ma trận Eise hay '
                    //                   'còn gọi là Eise box. Phương pháp này chi công '
                    //                   'việc của bạn thành 4 mức độ ưu tiên khác nhau.'
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //   InkWell(
                    //     onTap: (){
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) => Dialog(
                    //           insetPadding: EdgeInsets.all(30),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(16.0),
                    //             child: Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text('Đánh giá ứng dụng',style: TextStyle(
                    //                     fontSize: SizeConst.size22, color: ColorConstant.black,fontWeight: FontWeight.bold)),
                    //                 Utils.getSpaceView(0, SizeConst.h20),
                    //                 Text('Đánh giá trải nghiệm ứng dụng Time For Life của bạn ?',style:  TextStyle(
                    //                     fontSize: SizeConst.size16, color: ColorConstant.black,fontWeight: FontWeight.normal),),
                    //                 Utils.getSpaceView(0, SizeConst.h20),
                    //                 RatingBar.builder(
                    //                   itemSize: 30.0,
                    //                   initialRating: 3,
                    //                   minRating: 1,
                    //                   direction: Axis.horizontal,
                    //                   allowHalfRating: true,
                    //                   itemCount: 5,
                    //                   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //                   itemBuilder: (context, _) => Icon(
                    //                     Icons.star,
                    //                     color: Colors.amber,
                    //                   ),
                    //                   onRatingUpdate: (rating) {
                    //                     print(rating);
                    //                   },
                    //                 ),
                    //                 Utils.getSpaceView(0, SizeConst.h20),
                    //                 InkWell(
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       color: ColorConstant.colorthu,
                    //                       border: Border.all(color: Colors.grey),
                    //                       borderRadius: BorderRadius.circular(10),
                    //                     ),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 45),
                    //                       child: Text('Gửi đánh giá',style:  TextStyle(
                    //                           fontSize: SizeConst.size16, color: ColorConstant.white,fontWeight: FontWeight.bold),),
                    //                     ),
                    //                   ),
                    //                   onTap: (){
                    //                     // controller.deleteData();
                    //                   },
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),);
                    //     },
                    //     child: Column(
                    //       children: [
                    //         RatingBar.builder(
                    //           itemSize: 30.0,
                    //           initialRating: 3,
                    //           minRating: 1,
                    //           direction: Axis.horizontal,
                    //           allowHalfRating: true,
                    //           itemCount: 5,
                    //           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //           itemBuilder: (context, _) => Icon(
                    //             Icons.star,
                    //             color: Colors.amber,
                    //           ),
                    //           onRatingUpdate: (rating) {
                    //             print(rating);
                    //           },
                    //         ),
                    //         Center(child: Text('Gửi đánh giá'),)
                    //       ],
                    //     ),
                    //   )
                    //     ],
                    //   ),
                    // )
                  ],
                ),

              ),
            ),
          ),
        )
      ],
    );
  }
}
