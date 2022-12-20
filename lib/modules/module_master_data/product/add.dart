import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_dropdown_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String dropdownValue = 'One';
  String dropdownValue2 = 'One';
  String dropdownValue3 = 'One';
  String dropdownValue4 = 'One';
  List strings = ['One', 'Two', 'Free', 'Four'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: const Text("Company / Manufacturer"),
          ),
          CustomDropdown(context: context, value: dropdownValue , string: strings),

          CustomTextField(hintText: "Enter Product Name"),
          CustomTextField(hintText: "Enter Bar Code"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w,vertical: 10.w),
            child: const Text("Primary Unit"),
          ),
          CustomDropdown(context: context, value:dropdownValue2, string: strings),

          CustomTextField(hintText:  "Enter Secondary Unit Size"),
          CustomTextField(hintText: "Enter Total Size"),

          CustomTextField(hintText:"P.P.Secondary Unit"),
          CustomTextField(hintText: "T.P.Secondary Unit"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w,vertical: 10.w),
            child: const Text("Product Group"),
          ),
          CustomDropdown(context: context, value: dropdownValue3, string: strings),


          CustomTextField(hintText: "Enter Code"),
          CustomTextField(hintText: "Enter Location"),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w,vertical: 10.w),
            child: const Text("Secondry Unit"),
          ),
          CustomDropdown(context: context, value: dropdownValue4, string: strings),
          CustomTextField(hintText:  "Enter Secondary Unit Qty."),
          CustomTextField(hintText: "P.P.Primary Unit"),
          CustomTextField(hintText: "T.P.Primary Unit"),
          CustomTextField(hintText: "O.S.Primary Unit"),
          CustomButton(function: () {  },),

        ],
      ),
    );
  }
}