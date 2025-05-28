import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sample_app/Views/Home/HomeScreen.dart';
import 'package:sample_app/Views/NewSignUpScreen.dart';
import 'package:sample_app/Views/NotificationService.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDYnrjllE65zK6ramiqSBj-K0lwDeteO5s',
    appId: '1:912297602062:android:8b538f96216ad6499ea05f',
    messagingSenderId: 'sendid',
    projectId: 'sampleapp-a743b',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  await NotificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen());
      },
    );
  }
}
