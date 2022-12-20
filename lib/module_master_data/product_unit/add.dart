import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field_widget.dart';

class AddProductUnit extends StatefulWidget {
  const AddProductUnit({Key? key}) : super(key: key);

  @override
  State<AddProductUnit> createState() => _AddProductUnitState();
}

class _AddProductUnitState extends State<AddProductUnit> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(hintText: "Enter Unit Name"),
          CustomTextField(hintText: "Enter Short Name"),
          CustomButton(function: () {  },),

        ],
      ),
    );
  }
}