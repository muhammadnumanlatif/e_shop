import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddSaleArea extends StatefulWidget {
  AddSaleArea({Key? key}) : super(key: key);

  @override
  State<AddSaleArea> createState() => _AddSaleAreaState();
}

class _AddSaleAreaState extends State<AddSaleArea> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(hintText: "Enter Area Name"),
          CustomTextField(hintText: "Enter Area Code"),
          CustomButton(function: () {  },),

        ],
      ),
    );
  }
}