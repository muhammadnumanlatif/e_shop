import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class UserPermissionScreen extends StatefulWidget {
  const UserPermissionScreen({Key? key}) : super(key: key);

  @override
  State<UserPermissionScreen> createState() => _UserPermissionScreenState();
}

class _UserPermissionScreenState extends State<UserPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("User Permission"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
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



