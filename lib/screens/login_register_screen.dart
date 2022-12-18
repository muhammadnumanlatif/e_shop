import 'package:e_shop/screens/permission_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
            Tab(text: "Login", icon: Icon(Icons.login)),
            Tab(text: "Register",icon: Icon(Icons.logout),),
          ]),
        ),
        body: const TabBarView(
          children: [
            Login(),
            Register(),
          ],
        ),
      ),
    );
  }
}

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
          Container(
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
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Enter Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
                icon: Icon(
                  Icons.vpn_key,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Enter Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
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

          GestureDetector(
            onTap: () {
              // Write Click Listener Code Here.
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PermissionDashboardScreen()));
            },
            child: Container(

              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 70.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Theme.of(context).primaryColor, Colors.grey.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ),
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
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Full Name",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),


          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
                icon: Icon(
                  Icons.vpn_key,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Enter Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
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
                icon: Icon(
                  Icons.vpn_key,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Confirm Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              // Write Click Listener Code Here.
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 54.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [(Theme.of(context).primaryColor), Colors.grey.shade200],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ),
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
              child: const Text(
                "REGISTER",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
