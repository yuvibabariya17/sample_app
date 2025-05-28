import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String validpin = "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verfication"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verification "),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text("Enter the code sent to your Number"),
            const Text("+91 9265449964"),
            SizedBox(
              height: 3.h,
            ),
            Pinput(
              validator: (value) {
                return value == validpin ? null : "Incorrect";
              },
              errorBuilder: (errorText, pin) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      errorText ?? "",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 5.h,
              width: SizerUtil.width / 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: Center(child: const Text("Validate")),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text("Didnt get the code"),
            const Text("Resend Code"),
          ],
        ));
  }
}
