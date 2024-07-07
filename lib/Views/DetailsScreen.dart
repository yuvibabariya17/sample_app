import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Model/AddressModel.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  final AddressModel data;

  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Details Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.id.toString(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            Text(
              data.name,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 2.h),
            Text(
              data.id.toString(),
              style: TextStyle(fontSize: 12.sp),
            ),
            // GestureDetector(
            //   onTap: () {
            //     launchPhoneCall(data.phoneNumber.toString());
            //   },
            //   child: Text(
            //     data.phoneNumber.toString(),
            //     style: TextStyle(fontSize: 12.sp),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
