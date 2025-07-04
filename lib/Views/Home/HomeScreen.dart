import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app/Common/Color_const.dart';
import 'package:sample_app/Controllers/HomeScreenController.dart';
import 'package:sample_app/Model/AddressModel.dart';
import 'package:sample_app/Model/HomeModel.dart';
import 'package:sample_app/Model/ImageModel.dart';
import 'package:sample_app/Views/Auth/LoginScreen.dart';
import 'package:sample_app/Views/Home/DetailsScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeScreenController());

  logOut() async {
    FirebaseAuth.instance.signOut().then(
      (value) {
        Get.offAll(const LoginScreen());
      },
    );
  }


  @override
  void initState() {
    controller.testMethod();
    // getAddressApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("HomeScreen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  logOut();
                },
                child: Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: blue),
                    child: const Center(
                      child: Text(
                        "LogOut",
                        style: TextStyle(color: white),
                      ),
                    )),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.testList.length,
                  itemBuilder: (context, index) {
                    AddressModel listData = controller.testList[index];
                    return GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(data: listData));
                        },
                        child: 
                        
                        Container(
                            margin: EdgeInsets.only(
                                left: 2.w, right: 2.w, top: 2.h),
                            padding: EdgeInsets.only(
                              left: 3.w,
                              right: 3.w,
                              top: 1.1.h,
                              bottom: 0.5.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.1,
                                  blurRadius: 5,
                                  offset: const Offset(0.2, 0.2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.amber),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listData.name),
                                    Text(listData.phone.toString()),
                                    // Text(listData.discription),
                                    // Text(listData.phoneNumber.toString())
                                  ],
                                ),
                              ],
                            )));
                  }

                  // FutureBuilder(
                  //   future: getAddressApi(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return ListView.builder(
                  //         physics: const BouncingScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: 6,
                  //         itemBuilder: (context, index) {
                  //           //  AddressModel listData = addressList[index];
                  //           return Shimmer.fromColors(
                  //             baseColor: Colors.grey.shade300,
                  //             highlightColor: Colors.grey.shade100,
                  //             period: const Duration(seconds: 10),
                  //             child: Container(
                  //                 margin: EdgeInsets.only(
                  //                     left: 2.w, right: 2.w, top: 2.h),
                  //                 padding: EdgeInsets.only(
                  //                   left: 3.w,
                  //                   right: 3.w,
                  //                   top: 1.1.h,
                  //                   bottom: 1.1.h,
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(20),
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Colors.white.withOpacity(0.2),
                  //                       spreadRadius: 0.1,
                  //                       blurRadius: 5,
                  //                       offset: const Offset(0.2, 0.2),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Container(
                  //                       height: 50,
                  //                       width: 50,
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(25),
                  //                           color: Colors.amber),
                  //                     ),
                  //                     SizedBox(
                  //                       width: 5.w,
                  //                     ),
                  //                     Column(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Container(
                  //                             height: 10,
                  //                             width: 200,
                  //                             color: Colors.white),
                  //                         Container(
                  //                             height: 10,
                  //                             width: 200,
                  //                             color: Colors.white),
                  //                         // Text(listData.discription),
                  //                         // Text(listData.phoneNumber.toString())
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //           );
                  //         },
                  //       );
                  //     } else {
                  //       return ListView.builder(
                  //         shrinkWrap: true,
                  //         itemCount: addressList.length,
                  //         itemBuilder: (context, index) {
                  //           AddressModel listData = addressList[index];
                  //           return GestureDetector(
                  //             onTap: () {
                  //               Get.to(DetailScreen(data: listData));
                  //             },
                  //             child: Container(
                  //                 margin: EdgeInsets.only(
                  //                     left: 2.w, right: 2.w, top: 2.h),
                  //                 padding: EdgeInsets.only(
                  //                   left: 3.w,
                  //                   right: 3.w,
                  //                   top: 1.1.h,
                  //                   bottom: 0.5.h,
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(20),
                  //                   color: Colors.white,
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Colors.black.withOpacity(0.2),
                  //                       spreadRadius: 0.1,
                  //                       blurRadius: 5,
                  //                       offset: const Offset(0.2, 0.2),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Container(
                  //                       height: 50,
                  //                       width: 50,
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(25),
                  //                           color: Colors.amber),
                  //                     ),
                  //                     SizedBox(
                  //                       width: 5.w,
                  //                     ),
                  //                     Column(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(listData.name),
                  //                         Text(listData.phone.toString()),
                  //                         // Text(listData.discription),
                  //                         // Text(listData.phoneNumber.toString())
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //           );
                  //         },
                  //       );
                  //     }
                  //   },
                  // ),

                  );
            }),
          )
        ]),
      ),
    );
  }
}
