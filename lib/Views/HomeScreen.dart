import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app/Controllers/HomeScreenController.dart';
import 'package:sample_app/Model/AddressModel.dart';
import 'package:sample_app/Model/HomeModel.dart';
import 'package:sample_app/Model/ImageModel.dart';
import 'package:sample_app/Views/DetailsScreen.dart';
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

  List<HomeScreenModel> homeList = [];
  Future<List<HomeScreenModel>> getHome() async {
    final response = await http.get(Uri.parse(""));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (var i in data) {
        homeList.add(HomeScreenModel.fromJson(i));
      }
      return homeList;
    } else {
      return homeList;
    }
  }

  // List<HomeScreenModel> homeList = <HomeScreenModel>[].obs;

  // //API CALLL
  // Future<List<HomeScreenModel>> getPostApi() async {
  //   final response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body) as List;
  //     homeList = data
  //         .map((json) => HomeScreenModel.fromJson(json as Map<String, dynamic>))
  //         .toList();
  //     return homeList;
  //   } else {
  //     throw Exception('Failed to load posts');
  //   }
  // }

  List<Imagemodel> imageList = [];

  Future<List<Imagemodel>> getImageApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (var i in data) {
        imageList.add(Imagemodel.fromJson(i));
      }
      return imageList;
    } else {
      return imageList;
    }
  }

  List<AddressModel> addressList = [];

  Future<List<AddressModel>> getAddressApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      addressList.clear();
      for (var i in data) {
        addressList.add(AddressModel.fromJson(i));
      }
      return addressList;
    } else {
      return addressList;
    }
  }

  @override
  void initState() {
    getAddressApi();
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
        child: FutureBuilder(
          future: getAddressApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  //  AddressModel listData = addressList[index];
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    period: Duration(seconds: 10),
                    child: Container(
                        margin:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
                        padding: EdgeInsets.only(
                          left: 3.w,
                          right: 3.w,
                          top: 1.1.h,
                          bottom: 1.1.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
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
                                Container(
                                    height: 10,
                                    width: 200,
                                    color: Colors.white),
                                Container(
                                    height: 10,
                                    width: 200,
                                    color: Colors.white),
                                // Text(listData.discription),
                                // Text(listData.phoneNumber.toString())
                              ],
                            ),
                          ],
                        )),
                  );
                },
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  AddressModel listData = addressList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailScreen(data: listData));
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
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
                        )),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
