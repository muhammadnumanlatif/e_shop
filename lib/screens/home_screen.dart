
import 'package:e_shop/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../modules/module_permission/login_register/login_register_screen.dart';
import 'company_settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      drawer: CustomDrawer(),
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
