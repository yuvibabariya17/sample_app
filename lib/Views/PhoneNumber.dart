import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app/Views/ForgotPasswordScreen.dart';
import 'package:sizer/sizer.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              errorText: "Enter Valid PhoneNUmber",
              hintText: "Enter Phone Number",
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.call,
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
          Container(
            height: 6.h,
            width: SizerUtil.width / 3,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
                onTap: () {
                  Get.to(ForgotPassword());
                },
                child: Center(child: Text("Next"))),
          )
        ],
      ),
    ));
  }
}
