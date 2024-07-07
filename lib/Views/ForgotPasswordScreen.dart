import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Controllers/ForgotPasswordController.dart';
import 'package:sample_app/Views/LoginScreen.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final controller = Get.put(ForgotPassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w),
        child: Column(
          children: [
            getCustomeFormFields(
                controller.newpassCtr, "Enter New Password", 1),
            getCustomeFormFields(
                controller.newpassCtr, "Confirm New Password", 2),
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
                    Get.to(const LoginScreen());
                  },
                  child: const Center(child: Text("Next"))),
            )
          ],
        ),
      ),
    );
  }

  getCustomeFormFields(
      TextEditingController? controllers, String hint, int index) {
    return TextFormField(
      controller: controllers,
      style: TextStyle(fontSize: 10.sp),
      keyboardType:
          index == 1 ? TextInputType.emailAddress : TextInputType.text,
      obscureText: index == 2 ? controller.obsecureText.value : false,
      onChanged: (value) {
        // if (index == 1) {
        //   controller.validatePhone(value);
        // } else {
        //   controller.validatePassword(value);
        // }
      },
      decoration: InputDecoration(
        errorText: index == 1
            ? controller.phoneModel.value.error
            : controller.passModel.value.error,
        hintText: hint,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.password_rounded,
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
        suffixIcon: GestureDetector(
          onTap: () {
            controller.obsecureText.value = !controller.obsecureText.value;
            setState(() {});
          },
          child: Icon(
            controller.obsecureText.value == true
                ? Icons.visibility_off
                : Icons.visibility,
            // color: primaryColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return index == 1 ? "Enter Phone Number" : "Enter Password";
        }
        return null;
      },
    );
  }
}
