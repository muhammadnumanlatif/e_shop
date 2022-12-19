import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  CustomTextField({
    Key? key, required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xffEEEEEE),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 100,
              color: Color(0xffEEEEEE)
          ),
        ],
      ),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}