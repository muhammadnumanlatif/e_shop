
import 'package:e_shop/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../modules/module_permission/login_register/login_register_screen.dart';
import 'company_settings_screen.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  int _index=1;
  List<Widget> screens =  [
    const CompanySettingScreen(),
    const LoginRegisterScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Shop"),
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
