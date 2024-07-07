import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

getformButton(Function fun, str, {required bool validate}) {
  return Container(
    height: 6.h,
    alignment: Alignment.center,
    width: SizerUtil.width / 1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: validate == true ? Colors.blue : Colors.grey,
      boxShadow: [
        BoxShadow(
            color: validate
                ? Colors.blue.withOpacity(0.2)
                : Colors.grey.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 1),
            spreadRadius: 3.0)
      ],
    ),
    child: Text(
      str,
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
    ),
  );
}
