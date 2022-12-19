import 'package:flutter/material.dart';

import 'company_settings_screen.dart';
import 'login_register/login_register_screen.dart';



class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int _index=1;
  List<Widget> screens =  [
    const CompanySettingScreen(),
    const LoginRegisterScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("E-Shop"),
        ),
        body: screens[_index],
        bottomNavigationBar:NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (index){
            setState(() {
              _index=index;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.settings), label:"Company Settings" ),
            NavigationDestination(icon: Icon(Icons.home), label:"Company Login/Register" ),
          ],));

  }
}
