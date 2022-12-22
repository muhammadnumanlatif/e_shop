import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../models/product_grouping_model.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddProductGroup extends StatefulWidget {
  const AddProductGroup({Key? key}) : super(key: key);

  @override
  State<AddProductGroup> createState() => _AddProductGroupState();
}

class _AddProductGroupState extends State<AddProductGroup> {
  TextEditingController? _groupNameEditingController;
  TextEditingController? _groupCodeEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper ;
  @override
  void initState() {
    _groupNameEditingController = TextEditingController();
    _groupCodeEditingController = TextEditingController();
    dbHelper=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            CustomTextField(textEditingController: _groupNameEditingController, hintText: "Enter Product Group"),
            CustomTextField( textEditingController:_groupCodeEditingController, hintText: "Enter Group Code"),
            CustomButton(function: () =>addData(context),),

          ],
        ),
      ),
    );
  }

  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if(form!.validate()) {

      form.save();
      ProductGroupingModel pgModel = ProductGroupingModel(
          0,
          _groupNameEditingController!.text,
          _groupCodeEditingController!.text,
          DateTime.now().toString());

      dbHelper!.saveProductGroupingData(pgModel).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Data saved Successfully")));
      }).catchError((onError){
        print(onError);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: $onError")));
      });

    }
  }

}
