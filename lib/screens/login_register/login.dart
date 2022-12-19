import 'package:e_shop/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(icon:  Icons.email,hintText: "Enter E-Mail",),
          CustomTextField(icon:  Icons.vpn_key,hintText: "Enter Password",),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Write Click Listener Code Here
              },
              child: const Text("Forget Password?"),
            ),
          ),

        CustomButton(function: (){},text: "LOGIN",)
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  CustomTextField({
    Key? key, required this.hintText, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 70.w),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE)
          ),
        ],
      ),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          icon: Icon(
           icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

