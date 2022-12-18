import 'package:e_shop/screens/company_settings_screen.dart';
import 'package:e_shop/screens/login_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          title: 'E-Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
home:  const Setting(),
        );
      },
    );
  }
}



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
