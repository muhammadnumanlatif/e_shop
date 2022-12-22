import 'package:e_shop/database_handler/dbHelper.dart';
import 'package:e_shop/screens/home_screen.dart';
import 'package:e_shop/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field_widget.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _emailEditingController;
  TextEditingController? _passwordEditingController;
  final _formKey = GlobalKey<FormState>();
DbHelper? dbHelper;
  @override

  void initState() {
    _emailEditingController=TextEditingController();
    _passwordEditingController=TextEditingController();
    dbHelper = DbHelper();
    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController!.dispose();
    _passwordEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
                icon:  Icons.email,
                hintText: "Enter E-Mail",
                textEditingController: _emailEditingController,
            inputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              icon:  Icons.vpn_key,
              hintText: "Enter Password",
              isObscureText: true,
              textEditingController: _passwordEditingController,
            ),
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

          CustomButton(function: (){
            if(_formKey.currentState!.validate()){
              dbHelper!.getLoginUser(_emailEditingController!.text, _passwordEditingController!.text).then((value) {
                print("Response: ${value}");
                if(value!=null){

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }else if(value==null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login Failed")));
                }

              }).catchError((onError){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: $onError")));
              });
            }
          },text: "Login",)
          ],
        ),
      ),
    );
  }
}
