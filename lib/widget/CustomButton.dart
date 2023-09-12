import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.color1,
    this.text,
    this.onttap,
  });
  Color? color1;
  String? text;
  Function()? onttap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onttap,
      child: Container(
        height: 50.sp,
        width: 280.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: color1,
        ),
        child: Center(
            child: Text(
          text.toString(),
          style: TextStyle(
              fontSize: 18.33,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
