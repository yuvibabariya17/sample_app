import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Model/ValidationModel.dart';

enum ScreenState { apiLoading, apiError, apiSuccess, noNetwork, noDataFound }

class LoginScreenController extends GetxController {
  var obsecureText = true.obs;

  // final InternetController networkManager = Get.find<InternetController>();
  late FocusNode emailNode, passNode;
  late TextEditingController emailCtr, passCtr;

  Rx<ScreenState> state = ScreenState.apiLoading.obs;

  @override
  void onInit() {
    emailNode = FocusNode();
    passNode = FocusNode();

    emailCtr = TextEditingController();
    passCtr = TextEditingController();

    super.onInit();
  }

  var isLoading = false.obs;
  var phoneModel = ValidationModel(null, null, isvalidate: false).obs;
  var emailModel = ValidationModel(null, null, isvalidate: false).obs;
  var passModel = ValidationModel(null, null, isvalidate: false).obs;

  void enableSignUpButton() {
    if (emailModel.value.isvalidate == false) {
      isFormInvalidate.value = false;
    } else if (passModel.value.isvalidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateEmail(String? val) {
    emailModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = "Enter Email Id";
        model.isvalidate = false;
      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailCtr.text.trim())) {
        model!.error = "Enter Valid Email Id";
        model.isvalidate = false;
      } else {
        model!.error = null;
        model.isvalidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePhone(String? val) {
    phoneModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = "Enter Phone Number";
        model.isvalidate = false;
      } else if (val.toString().length != 8) {
        model!.error = "Enter Valid Phone Number";
        model.isvalidate = false;
      } else {
        model!.error = null;
        model.isvalidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePassword(String? val) {
    passModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Password";
        model.isvalidate = false;
      } else if (val.length < 5) {
        model!.error = "Enter Valid Password";
        model.isvalidate = false;
      } else {
        model!.error = null;
        model.isvalidate = true;
      }
    });
    enableSignUpButton();
  }

  RxBool isFormInvalidate = false.obs;

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  // void signInAPI(context) async {
  //   var loadingIndicator = LoadingProgressDialog();
  //   try {
  //     if (networkManager.connectionType == 0) {
  //       loadingIndicator.hide(context);
  //       showDialogForScreen(context, "No Internet Connection", callback: () {
  //         Get.back();
  //       });
  //       return;
  //     }
  //     loadingIndicator.show(context, '');
  //     var response = await Repository.postForm({
  //       "email": emailCtr.text.toString(),
  //       "password": passCtr.text.toString(),
  //     }, ApiUrl.login, allowHeader: true);
  //     loadingIndicator.hide(context);
  //     var data = jsonDecode(response.body);
  //     logcat("RESPOnse", data);
  //     if (response.statusCode == 200) {
  //       var responseDetail = SignInModel.fromJson(data);
  //       if (responseDetail.success == true) {
  //         UserPreferences().saveSignInInfo(responseDetail);
  //         UserPreferences().setToken(responseDetail.authToken.toString());
  //         Get.offAll(const HomeScreen());
  //       } else {
  //         showDialogForScreen(context, data['message'].toString(),
  //             callback: () {});
  //       }
  //     } else {
  //       state.value = ScreenState.apiError;
  //       showDialogForScreen(context, data['message'].toString(),
  //           callback: () {});
  //     }
  //   } catch (e) {
  //     logcat("Exception", e);
  //     showDialogForScreen(context, "Server Error", callback: () {});
  //     loadingIndicator.hide(context);
  //   }
  // }

  // showDialogForScreen(context, String message, {Function? callback}) {
  //   showMessage(
  //       context: context,
  //       callback: () {
  //         if (callback != null) {
  //           callback();
  //         }
  //         return true;
  //       },
  //       message: message,
  //       title: Strings.login,
  //       negativeButton: '',
  //       positiveButton: Strings.continueBtn);
  // }
}
