import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Common/UiHelper.dart';
import 'package:sample_app/Views/Home/HomeScreen.dart';
import 'package:sizer/sizer.dart';

class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({super.key, required this.verificationId});
  String verificationId;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController otpCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12.h, right: 7.w, left: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              children: [
                Text(
                  "Enter Login Details",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Uihelper.customTextField(otpCtr, "Enter OTP", 1),
            SizedBox(
              height: 1.h,
            ),

            SizedBox(
              height: 7.h,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpCtr.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then(
                    (value) {
                      HomeScreen();
                    },
                  );
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Container(
                height: 6.h,
                alignment: Alignment.center,
                width: SizerUtil.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),

            // FadeInUp(
            //     from: 50,
            //     child: Obx(() {
            //       return getformButton(() {
            //         if (controller.isFormInvalidate.value == true) {
            //           Get.to(const HomeScreen());
            //         }
            //       }, "LOgin", validate: controller.isFormInvalidate.value);
            //     })),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
