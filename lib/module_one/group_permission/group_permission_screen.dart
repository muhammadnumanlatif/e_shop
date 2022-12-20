import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class GroupPermissionScreen extends StatefulWidget {
  const GroupPermissionScreen({Key? key}) : super(key: key);

  @override
  State<GroupPermissionScreen> createState() => _GroupPermissionScreenState();
}

class _GroupPermissionScreenState extends State<GroupPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Group Permission"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddGroupPermission(),
          ListofGroup()
        ]),
      ),
    );
  }
}



