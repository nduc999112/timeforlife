import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:timeforlife/ui/work/work_controller.dart';

class SettingController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WorkController workController = Get.find();
    User ?user;
    user=workController.user;
    print('setting ${user!.uid}');
  }
  void signout() async{
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    googleSignIn.isSignedIn().then((s) {print('đăng xuất thành công');});
    Get.offAll(LoginScreen());
  }
}