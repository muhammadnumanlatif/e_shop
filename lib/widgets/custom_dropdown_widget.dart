import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
 final BuildContext context;
 String value;
     final List string;

   CustomDropdown({Key? key, required this.context, required this.value, required this.string}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 10.w),
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
      child: DropdownButton<String>(
        value:widget.value,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24.sp,
        elevation: 16,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        isExpanded: true,

        onChanged: (String? newValue) {
          setState(() {
            widget.value = newValue!;
          });
        },
        items:widget.string.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
      ),
    );
  }
}
