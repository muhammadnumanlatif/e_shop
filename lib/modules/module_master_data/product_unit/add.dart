import 'package:e_shop/models/product_unit_model.dart';
import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddProductUnit extends StatefulWidget {
  const AddProductUnit({Key? key}) : super(key: key);

  @override
  State<AddProductUnit> createState() => _AddProductUnitState();
}

class _AddProductUnitState extends State<AddProductUnit> {
  TextEditingController? _unitNameEditingController;
  TextEditingController? _shortNameEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper ;
  @override
  void initState() {
    _unitNameEditingController = TextEditingController();
    _shortNameEditingController = TextEditingController();
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
            CustomTextField(
                textEditingController: _unitNameEditingController,
                hintText: "Enter Unit Name"),
            CustomTextField(
                textEditingController: _shortNameEditingController,
                hintText: "Enter Short Name"),
            CustomButton(function: ()=>addData(context),),

          ],
        ),
      ),
    );
  }
  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if(form!.validate()) {

      form.save();
      ProductUnitModel puModel = ProductUnitModel(
          0,
          0,
          _unitNameEditingController!.text,
          _shortNameEditingController!.text,
          DateTime.now().toString());

      dbHelper!.saveProductUnitData(puModel).then((value) {
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