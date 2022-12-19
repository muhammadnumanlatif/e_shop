import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

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
