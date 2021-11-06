import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class InfoController extends GetxController{
  var rating=0.0.obs;
  final databaseRef=FirebaseDatabase.instance.reference();
  User ? user;
  @override
  void onInit() {
    // TODO: implement onInit
    WorkController workController=Get.find();
    user=workController.user;
    super.onInit();

  }
  void selectrating(double ratingvalue){
    rating.value=ratingvalue;
    print(ratingvalue);
  }
  void ratinginsert() async{
    await databaseRef.child('Work').child(user!.uid).child('rating').set({
      'rating':rating.value
    }).catchError((onError){
      print('error ${onError}');
    });
  }
}