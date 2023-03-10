import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../modules/module_master_data/dashboard_module_two.dart';
import '../modules/module_permission/dashboard_permission.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
  buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,

      ),
      child: Column(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(height: 10.h,),
         Text("Naveed",style: TextStyle(fontSize: 25.sp,color: Colors.white),),
         Text("naveed@gmail.com",style: TextStyle(fontSize: 25.sp,color: Colors.white),),

        ],
      ),
    );
  }

  buildMenuItems(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Wrap(
        runSpacing: 10.0.h,
        children: [
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Permissions"),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPermission()));

            },
          ),

          ListTile(
            leading: Icon(Icons.perm_data_setting),
            title: Text("Master Data for Software Setting"),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardMasterData()));
            },
          ),

          ListTile(
            leading: Icon(Icons.payments),
            title: Text("Supplier / Payments"),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.point_of_sale),
            title: Text("Customer / Payments"),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.monetization_on_outlined),
            title: Text("Purchases"),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.inventory_outlined),
            title: Text("Sale"),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.report_outlined),
            title: Text("List / Report"),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
