import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final IconData? icon;
  final bool isObscureText;
  final TextInputType? inputType;
   CustomTextField({
    Key? key,
     required this.hintText,
     this.icon,
     this.isObscureText=false,
     this.textEditingController,
     this.inputType=TextInputType.text,
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
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        controller: textEditingController,
        obscureText: isObscureText,
        keyboardType:inputType,
        validator: (val)=>val!.length==0?"Please Enter $hintText":null,
        onSaved: (val)=>textEditingController!.text=val!,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}