import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  var isfromdata;
  DataScreen(this.isfromdata, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(isfromdata),
      ),
    );
  }
}
