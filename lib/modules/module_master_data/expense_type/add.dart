import 'package:e_shop/models/expense_type_model.dart';
import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddExpenseType extends StatefulWidget {
  const AddExpenseType({Key? key}) : super(key: key);

  @override
  State<AddExpenseType> createState() => _AddExpenseTypeState();
}

class _AddExpenseTypeState extends State<AddExpenseType> {
  TextEditingController? _expenseNameEditingController;
  TextEditingController? _expenseCodeEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper ;
  @override
  void initState() {
    _expenseNameEditingController = TextEditingController();
    _expenseCodeEditingController = TextEditingController();
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
            CustomTextField(textEditingController: _expenseNameEditingController, hintText: "Enter Expense Type"),
            CustomTextField(textEditingController: _expenseCodeEditingController, hintText: "Enter Expense Code"),
            CustomButton(function: ()=>addData(context),),
          ],
        ),
      )
    );
  }

  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if(form!.validate()) {

      form.save();
      ExpenseTypeModel etModel =ExpenseTypeModel(
          0,
          0,
          _expenseNameEditingController!.text,
          _expenseCodeEditingController!.text,
          DateTime.now().toString());

      dbHelper!.saveExpenseTypeData(etModel).then((value) {
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