import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field_widget.dart';

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
          CustomTextField(hintText: "Enter Group Name"),
          CustomTextField(hintText: "Enter Group Description"),
          CustomButton(function: () {  },),

        ],
      ),
    );
  }
}