import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class NewSignUpScreen extends StatefulWidget {
  const NewSignUpScreen({super.key});

  @override
  State<NewSignUpScreen> createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  File? pickedImage;

  void pickImage(ImageSource imgSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imgSource);
      if (photo != null) {
        setState(() {
          pickedImage = File(photo.path);
        });
      }
      Navigator.pop(context); // Close the dialog
    } catch (ex) {
      log(ex.toString());
    }
  }

  Widget showDialogForImage() {
    return AlertDialog(
      title: const Text("Pick Image From"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => pickImage(ImageSource.camera),
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text("Camera"),
          ),
          ListTile(
            onTap: () => pickImage(ImageSource.gallery),
            leading: const Icon(Icons.image),
            title: const Text("Gallery"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Sign Up"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12.h, right: 7.w, left: 7.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => showDialogForImage(),
                );
              },
              child: CircleAvatar(
                maxRadius: 5.h,
                backgroundImage:
                    pickedImage != null ? FileImage(pickedImage!) : null,
                child: pickedImage == null
                    ? const Icon(Icons.person, size: 30)
                    : null,
              ),
            ),
            SizedBox(height: 3.h),
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const TextField(decoration: InputDecoration(labelText: 'Password')),
          ],
        ),
      ),
    );
  }
}
