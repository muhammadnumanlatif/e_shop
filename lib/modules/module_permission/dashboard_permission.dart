import 'package:e_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/enter_screen.dart';
import 'group/group.dart';
import 'group_permission/group_permission_screen.dart';
import 'user_permission/user_permission.dart';
import 'user_to_group/user_to_group_screen.dart';

class DashboardPermission extends StatefulWidget {
  const DashboardPermission({Key? key}) : super(key: key);

  @override
  State<DashboardPermission> createState() => _DashboardPermissionState();
}

class _DashboardPermissionState extends State<DashboardPermission> {
  int _index = 0;
  List<Widget> screens = [
    const SaveGroupScreen(),
    const GroupPermissionScreen(),
    const UserPermissionScreen(),
    const GroupToUserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [

          LayoutBuilder(builder: (context,constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child:   NavigationRail(
                    leading: IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                    }, icon: Icon(Icons.arrow_back)),
                    backgroundColor: Theme.of(context).primaryColor,
                    indicatorColor: Colors.white,
                    selectedIconTheme:IconThemeData(
                      color: Theme.of(context).primaryColor
                    ) ,
                    destinations:
                    const [
                      NavigationRailDestination(icon: Icon(Icons.group),label: Text("Add Group")),
                      NavigationRailDestination(icon: Icon(Icons.group_add),label: Text("Group Perm.")),
                      NavigationRailDestination(icon: Icon(Icons.supervised_user_circle),label: Text("User Perm.")),
                      NavigationRailDestination(icon: Icon(Icons.supervised_user_circle_outlined),label: Text("Group to User")),
                    ],
                    selectedIndex: _index,
                    onDestinationSelected: (index){
                      setState(() {
                        _index=index;
                      });
                    },
                  ),
                ),
              ),
            );
          }),
            Expanded(child: screens[_index]),
          ],
        ),
      ),
    );
  }
}
