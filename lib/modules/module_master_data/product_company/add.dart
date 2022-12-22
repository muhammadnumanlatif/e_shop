

import 'package:e_shop/models/product_company_model.dart';
import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  TextEditingController? _companyNameEditingController;
  TextEditingController? _companyCodeEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper ;
  @override
  void initState() {
    _companyNameEditingController = TextEditingController();
    _companyCodeEditingController = TextEditingController();
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
                textEditingController: _companyNameEditingController,
                hintText: "Enter Company Name"),
            CustomTextField(
                textEditingController: _companyCodeEditingController,
                hintText: "Enter Company Code"),

            CustomButton(function: ()=>addData(context)),
          ],
        ),
      ),
    );
  }
  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if(form!.validate()) {

      form.save();
      ProductCompanyModel pcModel = ProductCompanyModel(
          0,
          0,
          _companyNameEditingController!.text,
          _companyCodeEditingController!.text,
          DateTime.now().toString());

      dbHelper!.saveProductCompanyData(pcModel).then((value) {
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

