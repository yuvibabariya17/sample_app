import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app/Common/UiHelper.dart';
import 'package:sample_app/Views/Auth/ForgotPasswordScreen.dart';
import 'package:sizer/sizer.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController emailCtr = TextEditingController();

  forgotPassword(String email) async {
    if (email == "") {
      Uihelper.customAlertBox(context, "Enter an Email");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
      child: Column(
        children: [
          TextFormField(
            controller: emailCtr,
            decoration: InputDecoration(
              errorText: "Enter Valid PhoneNUmber",
              hintText: "Enter Email",
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mail,
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
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          GestureDetector(
            onTap: () {
              print("CLICKKK:::::");
              forgotPassword(emailCtr.text.toString());
            },
            child: Container(
              height: 6.h,
              width: SizerUtil.width / 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("Reset Password")),
            ),
          )
        ],
      ),
    ));
  }
}
