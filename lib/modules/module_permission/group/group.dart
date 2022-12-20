import 'package:e_shop/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add.dart';
import 'list.dart';

class SaveGroupScreen extends StatefulWidget {
  const SaveGroupScreen({Key? key}) : super(key: key);

  @override
  State<SaveGroupScreen> createState() => _SaveGroupScreenState();
}

class _SaveGroupScreenState extends State<SaveGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
                    title: const Text("Group"),
          bottom: const TabBar(
  indicatorColor: Colors.white,
              tabs: [
                Tab(text:"Add.",icon: Icon( Icons.add),),
                Tab(text:"List",icon: Icon( Icons.list),),
              ],
          ),
        ),
        body: const TabBarView(children: [
          AddGroup(),
          ListofGroup()
        ]),
      ),
    );
  }
}


