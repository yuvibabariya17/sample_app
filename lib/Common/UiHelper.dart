import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sample_app/Common/Color_const.dart';
import 'package:sizer/sizer.dart';

class Uihelper {
  static customAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"))
          ],
          title: Text(text),
        );
      },
    );
  }

  static customTextField(
      TextEditingController? controllers, String hint, int index) {
    return TextFormField(
      controller: controllers,
      style: TextStyle(fontSize: 10.sp),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: white,
        filled: true,
        focusColor: black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        // errorText: index == 1
        //     ? controller.emailModel.value.error
        //     : controller.passModel.value.error,
        hintText: hint,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 3.w,
            ),
            Icon(
              index == 1 ? Icons.email : Icons.password_rounded,
              // color: primaryColor,
            ),
            SizedBox(
              width: 3.w,
            ),
            Container(
              color: Colors.grey,
              width: 0.5.w,
              height: 3.5.h,
            ),
            SizedBox(
              width: 2.w,
            ),
          ],
        ),
        // suffixIcon: index == 2
        //     ? GestureDetector(
        //         onTap: () {
        //           controller.obsecureText.value =
        //               !controller.obsecureText.value;
        //           setState(() {});
        //         },
        //         child: Icon(
        //           controller.obsecureText.value == true
        //               ? Icons.visibility_off
        //               : Icons.visibility,
        //           // color: primaryColor,
        //         ),
        //       )
        //     : null,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return index == 1 ? "Enter Email Address" : "Enter Password";
        }
        return null;
      },
    );
  }
}
