import 'package:e_shop/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_text_field_widget.dart';


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

        CustomButton(function: (){},text: "Login",)
        ],
      ),
    );
  }
}
