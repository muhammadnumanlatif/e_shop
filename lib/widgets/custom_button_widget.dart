import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback function;
  final String text;
   CustomButton({
    Key? key, required this.function, this.text="Save",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        height: 54.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,

          ],                    begin: Alignment.centerLeft,
              end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow:  [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE)
            ),
          ],
        ),
        child:  Text(
        text,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}