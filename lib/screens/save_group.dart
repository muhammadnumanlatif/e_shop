import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 54.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)
                ),
              ],
            ),
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Enter Group Name",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height:
                125.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)
                ),
              ],
            ),
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              maxLines: 8, //or null
              maxLength: 50,
                              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Enter Group Description",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Write Click Listener Code Here.
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 54.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Theme.of(context).primaryColor, Colors.grey.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: const Text(
                "Save Group",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListofGroup extends StatefulWidget {
  const ListofGroup({Key? key}) : super(key: key);

  @override
  State<ListofGroup> createState() => _ListofGroupState();
}

class _ListofGroupState extends State<ListofGroup> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("List of Group"),
    );
  }
}
