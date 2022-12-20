import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
       CustomTextField(hintText: "Enter Full Name", icon: Icons.person),
       CustomTextField(hintText: "Enter Password", icon: Icons.vpn_key),
       CustomTextField(hintText: "Confirm Password", icon: Icons.vpn_key),

          CustomButton(function: () {  },text: "Register",),

        ],
      ),
    );
  }
}
