import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/string_constant.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timeforlife/ui/homepage/homepage_view.dart';

import 'package:timeforlife/ui/login/loginscreen.dart';
import 'package:timeforlife/ui/work/work_view.dart';

class RegisterController extends GetxController {
  GoogleSignIn? googleSign;
  var isSignIn = false.obs;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  User? get userProfile => firebaseAuth.currentUser;

  var tecUsername = TextEditingController();
  var tecPassword = TextEditingController();
  var tecRePassword = TextEditingController();

  Rx<dynamic> username = Rxn();
  Rx<dynamic> password = Rxn();
  Rx<dynamic> repassword = Rxn();

  Rx<dynamic> errUsername = Rxn();
  Rx<dynamic> errPassword = Rxn();
  Rx<dynamic> errRePassword = Rxn();

  void createUser(String email,String password) async{
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print('$value');
          Get.offAll(LoginScreen());
    }).catchError((onError)=>
        Get.snackbar("Lỗi tạo tài khoản", onError.message),
    );
  }
  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthState);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
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

  login() {
    Get.to(()=>WorkView(), arguments: firebaseAuth.currentUser);
  }

  loginFb(){
    FacebookAuth.instance.login(
      permissions:["public_profile","email"]
    ).then((value) => {
      print(value.message)
    });
  }

  validateUsername() {
    username.value = tecUsername.value.text.toString().trim();
    print('${username.value.length}');
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
    repassword.value = tecRePassword.value.text.toString().trim();
    if (password.value!=repassword.value) {
      errPassword.value = StringConstant.errRePassWord;
    } else {
      errPassword.value = null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  handleAuthState(isSignIn) {
    if (isSignIn) {
      print('login');
    } else {
      print('no login');
    }
  }
}
