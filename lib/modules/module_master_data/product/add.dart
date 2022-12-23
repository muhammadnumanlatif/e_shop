import 'dart:convert';

import 'package:e_shop/database_handler/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/product_model.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_dropdown_widget.dart';
import '../../../widgets/custom_text_field_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController? _productNameEditingController;
  TextEditingController? _barCodeEditingController;
  TextEditingController? _secondaryUnitSizeEditingController;
  TextEditingController? _totalSizeEditingController;
  TextEditingController? _ppSecondaryUnitEditingController;
  TextEditingController? _tpSecondaryUnitEditingController;
  TextEditingController? _codeEditingController;
  TextEditingController? _locationEditingController;
  TextEditingController? _secondaryUnitQtyEditingController;
  TextEditingController? _ppPrimaryUnitEditingController;
  TextEditingController? _tpPrimaryUnitEditingController;
  TextEditingController? _osPrimaryUnitEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper;
  @override
  void initState() {
    _productNameEditingController = TextEditingController();
    _barCodeEditingController = TextEditingController();
    _secondaryUnitSizeEditingController = TextEditingController();
    _totalSizeEditingController = TextEditingController();
    _ppSecondaryUnitEditingController = TextEditingController();
    _tpSecondaryUnitEditingController = TextEditingController();
    _codeEditingController = TextEditingController();
    _locationEditingController = TextEditingController();
    _secondaryUnitQtyEditingController = TextEditingController();
    _ppPrimaryUnitEditingController = TextEditingController();
    _tpPrimaryUnitEditingController = TextEditingController();
    _osPrimaryUnitEditingController = TextEditingController();
    dbHelper = DbHelper();
    company_value = companies[0];
    primary_unit_value = punits[0];
    product_group_value = groups[0];
    secondary_unit_value = sunits[0];
    getCompany();
    getGroup();
    getPrimayUnit();
    getSecondaryUnit();
    super.initState();
  }

  @override
  void dispose() {
    _productNameEditingController!.dispose();
    _barCodeEditingController!.dispose();
    _secondaryUnitSizeEditingController!.dispose();
    _totalSizeEditingController!.dispose();
    _ppSecondaryUnitEditingController!.dispose();
    _tpSecondaryUnitEditingController!.dispose();
    _codeEditingController!.dispose();
    _locationEditingController!.dispose();
    _secondaryUnitQtyEditingController!.dispose();
    _ppPrimaryUnitEditingController!.dispose();
    _tpPrimaryUnitEditingController!.dispose();
    _osPrimaryUnitEditingController!.dispose();
    super.dispose();
  }

  String? company_value;
  String? primary_unit_value;
  String? product_group_value;
  String? secondary_unit_value;
  List strings = ["Select", 'One', 'Two', 'Free', 'Four'];
  List companies = ["Select"];
  List punits = ["Select"];
  List sunits = ["Select"];
  List groups = ["Select"];



  void getSecondaryUnit() {
    var company = dbHelper!.getProductUnit();
    company.then((value) => value.forEach((e) {
      sunits.add(e["sUnitName"]);
    }));
  }

  void getGroup() {
    var company = dbHelper!.getProductGrouping();
    company.then((value) => value.forEach((e) {
      groups.add(e["sGroupName"]);
    }));
  }

  void getCompany() {
    var company = dbHelper!.getProductCompany();
    company.then((value) => value.forEach((e) {
          companies.add(e["sCompanyName"]);
        }));
  }

  void getPrimayUnit() {
    var company = dbHelper!.getProductUnit();
    company.then((value) => value.forEach((e) {
      punits.add(e["sUnitName"]);
    }));
  }

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
          CustomDropdown(
              context: context, value: company_value, string: companies),
          CustomTextField(
              textEditingController: _productNameEditingController,
              hintText: "Enter Product Name"),
          CustomTextField(
              textEditingController: _barCodeEditingController,
              hintText: "Enter Bar Code"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 10.w),
            child: const Text("Primary Unit"),
          ),
          CustomDropdown(
              context: context, value: primary_unit_value, string: punits),
          CustomTextField(
              textEditingController: _secondaryUnitQtyEditingController,
              hintText: "Enter Secondary Unit Size"),
          CustomTextField(
              textEditingController: _totalSizeEditingController,
              hintText: "Enter Total Size"),
          CustomTextField(
              textEditingController: _ppSecondaryUnitEditingController,
              hintText: "P.P.Secondary Unit"),
          CustomTextField(
              textEditingController: _tpSecondaryUnitEditingController,
              hintText: "T.P.Secondary Unit"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 10.w),
            child: const Text("Product Group"),
          ),
          CustomDropdown(
              context: context, value: product_group_value, string: groups),
          CustomTextField(
              textEditingController: _codeEditingController,
              hintText: "Enter Code"),
          CustomTextField(
              textEditingController: _locationEditingController,
              hintText: "Enter Location"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 10.w),
            child: const Text("Secondry Unit"),
          ),
          CustomDropdown(
              context: context, value: secondary_unit_value, string: sunits),
          CustomTextField(
              textEditingController: _secondaryUnitQtyEditingController,
              hintText: "Enter Secondary Unit Qty."),
          CustomTextField(
              textEditingController: _ppPrimaryUnitEditingController,
              hintText: "P.P.Primary Unit"),
          CustomTextField(
              textEditingController: _tpPrimaryUnitEditingController,
              hintText: "T.P.Primary Unit"),
          CustomTextField(
              textEditingController: _osPrimaryUnitEditingController,
              hintText: "O.S.Primary Unit"),
          CustomButton(
            function: () {},
          ),
        ],
      ),
    );
  }

  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      ProductModel pModel = ProductModel();

      dbHelper!.saveProductData(pModel).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Data saved Successfully")));
      }).catchError((onError) {
        print(onError);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $onError")));
      });
    }
  }
}
