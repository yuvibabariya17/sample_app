import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Common/UiHelper.dart';
import 'package:sample_app/Views/OtpScreen.dart';
import 'package:sizer/sizer.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController phoneCtr = TextEditingController();

  phoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          print("Verification failed: ${ex.message}");
          Uihelper.customAlertBox(context, ex.message ?? "Verification failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(VerifyOtpScreen(
            verificationId: verificationId,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneCtr.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
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

            Uihelper.customTextField(phoneCtr, "Enter Phone Number", 1),
            SizedBox(
              height: 1.h,
            ),

            SizedBox(
              height: 7.h,
            ),
            GestureDetector(
              onTap: () {
                print("OTPPSENT");
                phoneAuth();
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
