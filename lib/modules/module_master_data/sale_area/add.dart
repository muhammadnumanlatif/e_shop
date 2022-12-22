import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';
import '../../../models/area_model.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddSaleArea extends StatefulWidget {
  AddSaleArea({Key? key}) : super(key: key);

  @override
  State<AddSaleArea> createState() => _AddSaleAreaState();
}

class _AddSaleAreaState extends State<AddSaleArea> {

  TextEditingController? _areaNameEditingController;
  TextEditingController? _areaCodeEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper ;
  @override
  void initState() {
    _areaNameEditingController = TextEditingController();
    _areaCodeEditingController = TextEditingController();
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
                 textEditingController: _areaNameEditingController,
                hintText: "Enter Area Name"),
            CustomTextField(
                textEditingController: _areaCodeEditingController,
                hintText: "Enter Area Code"),
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
        AreaModel areaModel = AreaModel(
            0,
            0,
            _areaNameEditingController!.text,
            _areaCodeEditingController!.text,
            DateTime.now().toString());

        dbHelper!.saveAreaData(areaModel).then((value) {
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