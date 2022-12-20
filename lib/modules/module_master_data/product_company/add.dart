
import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          CustomTextField(hintText: "Enter Company Name"),
          CustomTextField(hintText: "Enter Company Code"),

          CustomButton(function: (){}),
        ],
      ),
    );
  }
}

