import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timeforlife/commons/constant/string_constant.dart';
import 'package:timeforlife/ui/homepage/homepage_view.dart';
import 'package:timeforlife/ui/register/registerview.dart';


class LoginController extends GetxController {
  GoogleSignIn? googleSign;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  var tecUsername = TextEditingController();
  var tecPassword = TextEditingController();
  var tecRePassword = TextEditingController();

  Rx<dynamic> username = Rxn();
  Rx<dynamic> password = Rxn();
  Rx<dynamic> repassword = Rxn();

  Rx<dynamic> errUsername = Rxn();
  Rx<dynamic> errPassword = Rxn();
  Rx<dynamic> errRePassword = Rxn();
  @override
  void onReady() async {
    googleSign = GoogleSignIn();

  }
  loginGoogle() async {
    GoogleSignInAccount? googleSignAccount = await googleSign!.signIn();
    if (googleSignAccount == null) {
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(oAuthCredential);
      Get.to(()=>HomePageUI(), arguments: firebaseAuth.currentUser);
      // print('check ${firebaseAuth.currentUser!.displayName}');

    }
  }

  validateUsername() {
    username.value = tecUsername.value.text.toString().trim();
      print('${username.value}');
    if (username.value.toString().trim().length == 0) {
      errUsername.value = StringConstant.errNullUsername;
    } else {
      errUsername.value = null;
    }
  }

  validatePassWord() {
    password.value = tecPassword.value.text.toString().trim();

    if (password.value.toString().trim().length == 0) {
      errPassword.value = StringConstant.errNullPassWord;
    } else {
      errPassword.value = null;
    }
  }

  validateRePassWord() {
    password.value = tecPassword.value.text.toString().trim();
    repassword.value=tecRePassword.value.text.toString().trim();
    if (password.value!=repassword.value) {
      errRePassword.value = StringConstant.errRePassWord;
    } else {
      errRePassword.value = null;
    }
  }
  gotoSignUp(){
    Get.to(RegisterScreen());
  }

  void login(String email,String password) async
  {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(()=>HomePageUI(),arguments: value.user)).
    catchError((onError)=>
        Get.snackbar("Error while sign in ", onError.message));
  }

  void login2(){
    Get.to(()=>HomePageUI());
  }
}