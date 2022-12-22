import 'package:e_shop/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DbHelper? dbHelper;
  TextEditingController? _emailEditingController;
  TextEditingController? _uidEditingController;
  TextEditingController? _passwordEditingController;
  TextEditingController? _conPasswordEditingController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailEditingController=TextEditingController();
    _uidEditingController=TextEditingController();
    _passwordEditingController=TextEditingController();
    _conPasswordEditingController=TextEditingController();
    dbHelper = DbHelper();
    super.initState();
  }
  
  @override
  void dispose() {
    _uidEditingController!.dispose();
    _passwordEditingController!.dispose();
    _emailEditingController!.dispose();
    _conPasswordEditingController!.dispose();
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
             textEditingController: _emailEditingController,
             hintText: "Enter E-mail", icon: Icons.person,
           inputType: TextInputType.emailAddress,
         ),
         CustomTextField(
          textEditingController: _passwordEditingController,
           hintText: "Enter Password", icon: Icons.vpn_key,isObscureText: true,),
         CustomTextField(
           textEditingController: _conPasswordEditingController,
           hintText: "Confirm Password", icon: Icons.vpn_key,isObscureText: true,),

            CustomButton(function:()=>
                register(context),text: "Register",),

          ],
        ),
      ),
    );
  }

  void register(BuildContext context) {
final form = _formKey.currentState;
if(form!.validate()) {
  if (_passwordEditingController!.text != _conPasswordEditingController!.text
  ) {

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password are not matching")));
  }else{
    form.save();
    UserModel userModel = UserModel(
        "",
        _emailEditingController!.text,
        DateTime.now().toString(),
        _passwordEditingController!.text);

    dbHelper!.saveUserData(userModel).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data saved Successfully")));
    }).catchError((onError){
      print(onError);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $onError")));
    });

  }
}
  }
}
