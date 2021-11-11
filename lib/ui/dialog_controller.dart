import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timeforlife/commons/constant/string_constant.dart';

import 'detailuser/detailuser_controller.dart';

class DialogController extends GetxController{
  var tecCurrentPassword = TextEditingController();
  var tecNewPassword = TextEditingController();
  var tecReNewPassword = TextEditingController();

  Rx<dynamic> err = Rxn();

  var dataCurentPassword=''.obs;
  var dataNewPassword=''.obs;
  var dataReNewPassword=''.obs;

  getCurrentPassword(){
    dataCurentPassword.value = tecCurrentPassword.value.text.toString().trim();
    print('${dataCurentPassword.value}');
  }
  getNewPassword(){
    dataNewPassword.value = tecNewPassword.value.text.toString().trim();
    print('${dataNewPassword.value}');
  }
  getRReNewPassword(){
    dataReNewPassword.value = tecReNewPassword.value.text.toString().trim();
    print('${dataReNewPassword.value}');
  }
  void changePass(){
    if(dataNewPassword!=dataReNewPassword){
      // Get.snackbar('Thông báo', 'Mật khẩu không trùng khớp');
    }else{
      DetailsUserController detalisController=Get.find();
      detalisController.changePassword(dataCurentPassword.value, dataNewPassword.value);
      dataCurentPassword.value='';
      dataNewPassword.value='';
      dataReNewPassword.value='';
    }
  }


  validateRePassWord() {
    dataReNewPassword.value = tecReNewPassword.value.text.toString().trim();
    dataNewPassword.value = tecNewPassword.value.text.toString().trim();
    if (dataNewPassword.value!=dataCurentPassword.value) {
      err.value = StringConstant.errRePassWord;
    } else {
      err.value = null;
    }
  }
}