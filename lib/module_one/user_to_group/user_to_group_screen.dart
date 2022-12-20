import 'package:e_shop/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button_widget.dart';
import 'add.dart';
import 'list.dart';

class GroupToUserScreen extends StatefulWidget {
  const GroupToUserScreen({Key? key}) : super(key: key);

  @override
  State<GroupToUserScreen> createState() => _GroupToUserScreenState();
}

class _GroupToUserScreenState extends State<GroupToUserScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("User to Group"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs:
            [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: TabBarView(children: [
          AddGroupPermission(),
          ListofGroup()
        ]),
      ),
    );
  }
}



