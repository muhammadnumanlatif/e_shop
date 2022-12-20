import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field_widget.dart';

class AddProductGroup extends StatefulWidget {
  const AddProductGroup({Key? key}) : super(key: key);

  @override
  State<AddProductGroup> createState() => _AddProductGroupState();
}

class _AddProductGroupState extends State<AddProductGroup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          CustomTextField(hintText: "Enter Product Group"),
          CustomTextField(hintText: "Enter Group Code"),
          CustomButton(function: () {  },),

        ],
      ),
    );
  }
}
