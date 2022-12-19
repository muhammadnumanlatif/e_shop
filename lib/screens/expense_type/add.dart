import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field_widget.dart';

class AddExpenseType extends StatefulWidget {
  const AddExpenseType({Key? key}) : super(key: key);

  @override
  State<AddExpenseType> createState() => _AddExpenseTypeState();
}

class _AddExpenseTypeState extends State<AddExpenseType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(hintText: "Enter Expense Type"),
          CustomTextField(hintText: "Enter Expense Code"),
          CustomButton(function: () {  },),
        ],
      ),
    );
  }
}