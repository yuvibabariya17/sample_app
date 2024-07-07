import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_app/Model/ValidationModel.dart';

class ForgotPassController extends GetxController {
  late TextEditingController newpassCtr, confirmPassCtr;

  var obsecureText = true.obs;

  @override
  void onInit() {
    newpassCtr = TextEditingController();
    confirmPassCtr = TextEditingController();
    super.onInit();
  }

  var isLoading = false.obs;
  var phoneModel = ValidationModel(null, null, isvalidate: false).obs;
  var passModel = ValidationModel(null, null, isvalidate: false).obs;
}
