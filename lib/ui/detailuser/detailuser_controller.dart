



import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeforlife/ui/login/login_controller.dart';

class DetailsUserController extends GetxController{
  var tecName = TextEditingController();
  var tecUserName = TextEditingController();
  var tecEmail = TextEditingController();
  var tecPhone = TextEditingController();
  var tecPass = TextEditingController();

  var dataName=''.obs;
  var dataUserName='**********'.obs;
  var dataEmail=''.obs;
  var dataPhone=''.obs;
  var dataPass='**********'.obs;
  final ImagePicker _picker = ImagePicker();
  var  image='/data/user/0/com.example.timeforlife/cache/image_picker3301734351519262830.jpg'.obs;

  final databaseRef=FirebaseDatabase.instance.reference();
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image.value=pickedFile.path;
      } else {
        print('No image selected.');
      }
  }
  void back(){
    Get.back();
  }
  User ?user;
  @override
  void onInit() {
    LoginController loginControler=Get.find();
    user=loginControler.firebaseAuth.currentUser;
    print(user);
    getData();
    // TODO: implement onInit
    super.onInit();
  }
  void getData(){
    tecName.text=user!.displayName??'';
    // tecUserName.text=user!.displayName??'';
    // tecPass.text=user!.displayName??'';
    tecEmail.text=user!.email??'';
    tecPhone.text=user!.phoneNumber??'';
    // tecName.text=user!.displayName??'';
  }
  getName(){
    dataName.value = tecName.value.text.toString().trim();
    print('${dataName.value}');
  }
  getUserName(){
    dataUserName.value = tecUserName.value.text.toString().trim();
    print('${dataUserName.value}');
  }
  getEmail(){
    dataEmail.value = tecEmail.value.text.toString().trim();
    print('${dataEmail.value}');
  }
  getPhone(){
    dataPhone.value = tecPhone.value.text.toString().trim();
    print('${dataPhone.value}');
  }
  getPass(){
    dataPass.value = tecPass.value.text.toString().trim();
    print('${dataPass.value}');
  }
  void updateData() async{

    // await databaseRef.child("Work").child(user!.uid).update(
    //     {
    //       'Name':dataName.value,
    //       'phone':dataPhone.value,
    //     }).then((value) => Get.snackbar("Thông báo", "Cập nhật thành công"));
  }
  void updateUserInfo() {
    var user = FirebaseAuth.instance.currentUser;
    user!.updateProfile(displayName: dataName.value, photoURL: image.value,).then((value){
      print("Profile has been changed successfully");
      //DO Other compilation here if you want to like setting the state of the app
    }).catchError((e){
      print("There was an error updating profile");
    });
  }

  void changePassword(String currentPassword, String newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email??'', password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        Get.snackbar('Thông báo','Đổi mật khẩu thành công');
      }).catchError((error) {
        //Error, show something

      });
    }).catchError((err) {

    });}
}