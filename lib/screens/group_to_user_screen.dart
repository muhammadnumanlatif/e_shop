import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: const TabBarView(children: [
          AddGroupPermission(),
          ListofGroup()
        ]),
      ),
    );
  }
}

class AddGroupPermission extends StatefulWidget {
  const AddGroupPermission({Key? key}) : super(key: key);

  @override
  State<AddGroupPermission> createState() => _AddGroupPermissionState();
}

class _AddGroupPermissionState extends State<AddGroupPermission> {

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
              child: const Text("Users Name"),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 10.w),
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
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24.sp,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                isExpanded: true,

                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Group Name"),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 10.w),
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
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24.sp,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                isExpanded: true,

                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 30.w),
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
                  "Save",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
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
    return const Center(child: Text("List of Group Permission"),);
  }
}

