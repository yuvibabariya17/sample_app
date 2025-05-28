import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_app/Model/AddressModel.dart';
import 'package:sample_app/Model/ListModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  // GET API CALL
  RxList<AddressModel> testList = <AddressModel>[].obs;

  Future<List<AddressModel>> testMethod() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      for (var i in data) {
        testList.add(AddressModel.fromJson(i));
      }
      return testList;
    } else {
      return testList;
    }
  }

// POST API CALL
  void login(String email, pass) async {
    try {
      final response = await http.post(Uri.parse(""), body: {
        'email': email,
        'password': pass,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Get.to(const HomeScreen());
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
