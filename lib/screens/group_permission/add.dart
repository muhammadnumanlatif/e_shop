import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_dropdown_widget.dart';


class AddGroupPermission extends StatefulWidget {
  const AddGroupPermission({Key? key}) : super(key: key);

  @override
  State<AddGroupPermission> createState() => _AddGroupPermissionState();
}

class _AddGroupPermissionState extends State<AddGroupPermission> {

  String dropdownValue = 'One';
  String dropdownValue2 = 'One';
  List strings = ['One', 'Two', 'Free', 'Four'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: const Text("Group Name"),
            ),
            CustomDropdown(context: context, value:dropdownValue, string: strings),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
              child: const Text("Permissions"),
            ),
            CustomDropdown(context: context, value: dropdownValue2, string: strings),
            CustomButton(function: () {  },),

          ],
        ),
      ),
    );
  }
}