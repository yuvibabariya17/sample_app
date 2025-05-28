import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sample_app/Views/Home/HomeScreen.dart';
import 'package:sample_app/Views/Auth/LoginScreen.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  @override
  void initState() {
    super.initState();
    checkuserMethod(); // Call checkUser on widget load
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  checkuserMethod() async {
    await Future.delayed(const Duration(seconds: 1));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.off(() => const HomeScreen());
    } else {
      Get.off(() => const LoginScreen());
    }
  }
}
