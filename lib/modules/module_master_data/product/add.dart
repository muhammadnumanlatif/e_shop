

import 'package:e_shop/database_handler/dbHelper.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController? _sWhatSecUnitIsEditingController;
  TextEditingController? _tpProfitEditingController;
  TextEditingController? _ppProfitEditingController;
  final _formKey = GlobalKey<FormState>();
  DbHelper? dbHelper;

  @override
  void initState() {
    _ppProfitEditingController = TextEditingController();
    _productNameEditingController = TextEditingController();
    _barCodeEditingController = TextEditingController();
    _secondaryUnitSizeEditingController = TextEditingController();
    _totalSizeEditingController = TextEditingController();
    _ppSecondaryUnitEditingController = TextEditingController();
    _tpSecondaryUnitEditingController = TextEditingController();
    _sWhatSecUnitIsEditingController=TextEditingController();
    _codeEditingController = TextEditingController();
    _locationEditingController = TextEditingController();
    _secondaryUnitQtyEditingController = TextEditingController();
    _ppPrimaryUnitEditingController = TextEditingController();
    _tpPrimaryUnitEditingController = TextEditingController();
    _osPrimaryUnitEditingController = TextEditingController();
    _tpProfitEditingController = TextEditingController();
    dbHelper = DbHelper();
    company_value = companies[0];
    primary_unit_value = punits[0];
    product_group_value = groups[0];
    secondary_unit_value = sunits[0];
    getCompany();
    getGroup();
    getPrimayUnit();
    getSecondaryUnit();
    doMultiply();
    super.initState();
  }

  @override
  void dispose() {
    _ppProfitEditingController!.dispose();
    _tpProfitEditingController!.dispose();
    _productNameEditingController!.dispose();
    _barCodeEditingController!.dispose();
    _secondaryUnitSizeEditingController!.dispose();
    _totalSizeEditingController!.dispose();
    _sWhatSecUnitIsEditingController!.dispose();
    _ppSecondaryUnitEditingController!.dispose();
    _tpSecondaryUnitEditingController!.dispose();
    _codeEditingController!.dispose();
    _locationEditingController!.dispose();
    _secondaryUnitQtyEditingController!.dispose();
    _ppPrimaryUnitEditingController!.dispose();
    _tpPrimaryUnitEditingController!.dispose();
    _osPrimaryUnitEditingController!.dispose();
    _osPrimaryUnitEditingController!.dispose();
    super.dispose();
  }

  String? company_value;
  String? primary_unit_value;
  String? product_group_value;
  String? secondary_unit_value;
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

  void doMultiply() {
    setState(() {
     double size = _secondaryUnitSizeEditingController!.text.isEmpty ? 0 : double.parse(_secondaryUnitSizeEditingController!.text);
     double qty = _secondaryUnitQtyEditingController!.text.isEmpty ? 0 : double.parse(_secondaryUnitQtyEditingController!.text);
      setState(() {
        double pro =(size*qty);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                textEditingController: _secondaryUnitSizeEditingController,
                hintText: "Enter Secondary Unit Size",
            inputType: TextInputType.number,
            ),
            //Total Size
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          height: 54.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)
              ),
            ],
          ),
          child: TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            controller: _secondaryUnitQtyEditingController,
            keyboardType:TextInputType.number,
            validator: (val)=>val!.length==0?"Please Enter Value":null,
              onChanged: (v){
              setState(() {
                _totalSizeEditingController!.text= (
                    int.parse(v)*
                        int.parse(_secondaryUnitSizeEditingController!.text)
                ).toString();
                _ppSecondaryUnitEditingController!.text=(
                    int.parse(_ppPrimaryUnitEditingController!.text)/
                        int.parse(v)
                ).toString();
              });

              },
              decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              label:Text ("Enter Secondary Unit Qty."),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),

        ),
            Row(
              children: [
                Expanded(child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffEEEEEE),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    enabled: false,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: _totalSizeEditingController,
                    keyboardType:TextInputType.number,
                    //validator: (val)=>val!.length==0?"Please Enter Value":null,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      label:Text("Total Size."),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),

                ),),
                Expanded(
                  child: CustomTextField(
                      textEditingController: _sWhatSecUnitIsEditingController,
                      inputType: TextInputType.text,
                      hintText: "ltr."),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 54.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                controller: _ppPrimaryUnitEditingController,
                keyboardType:TextInputType.number,
                validator: (val)=>val!.length==0?"Please Enter Value":null,
                onChanged: (v){
                  setState(() {
                    _ppSecondaryUnitEditingController!.text=(
                        int.parse(_ppPrimaryUnitEditingController!.text)/
                            int.parse(v)
                    ).toString();
                  });

                },
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                  label: Text("P.P.Primary Unit"),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),

            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 54.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextFormField(
                enabled: false,
                cursorColor: Theme.of(context).primaryColor,
                controller: _ppSecondaryUnitEditingController,
                keyboardType:TextInputType.number,
                //validator: (val)=>val!.length==0?"Please Enter Value":null,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                  label: Text("P.P.Secondary Unit"),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),

            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffEEEEEE),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 20),
                            blurRadius: 100,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: _tpPrimaryUnitEditingController,
                      keyboardType:TextInputType.number,
                      validator: (val)=>val!.length==0?"Please Enter Value":null,
                      onChanged: (v){
                        setState(() {
                          _ppProfitEditingController!.text=(
                              double.parse(v)-
                                  double.parse(_ppPrimaryUnitEditingController!.text)
                          ).toString();
                        });

                      },
                      decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        label: Text("T.P.primary"),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),

                  ),
                ),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffEEEEEE),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    enabled: false,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: _ppProfitEditingController,
                    keyboardType:TextInputType.number,
                    //validator: (val)=>val!.length==0?"Please Enter Value":null,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      label: Text("P.M."),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),

                ),),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffEEEEEE),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 20),
                            blurRadius: 100,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: _tpSecondaryUnitEditingController,
                      keyboardType:TextInputType.number,
                      validator: (val)=>val!.length==0?"Please Enter Value":null,
                      onChanged: (v){
                        setState(() {
                              _tpProfitEditingController!.text=(
                                  double.parse(v)-
                                  double.parse(_ppSecondaryUnitEditingController!.text)
                          ).toString();
                        });

                      },
                      decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        label: Text("T.P.Secondary"),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),

                  ),
                ),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffEEEEEE),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    enabled: false,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: _tpProfitEditingController,
                    keyboardType:TextInputType.number,
                    //validator: (val)=>val!.length==0?"Please Enter Value":null,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColor,
                      label: Text("P.M."),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),

                ),),
              ],
            ),

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
                textEditingController: _osPrimaryUnitEditingController,
                inputType: TextInputType.number,
                hintText: "O.S.Primary Unit"),
            CustomButton(
              function: ()=>addData(context),
            ),
          ],
        ),
      ),
    );
  }

  void addData(BuildContext context) {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      ProductModel pModel = ProductModel(
        isProductCompanyID: companies.indexOf(company_value),
        sProductName: _productNameEditingController!.text,
        sBarCode: _barCodeEditingController!.text,
        iBaseUnit: punits.indexOf(primary_unit_value),
        sPeacePerSize: _secondaryUnitSizeEditingController!.text,
        sWhatSecUnitIs: _sWhatSecUnitIsEditingController!.text,
          sTotalUnitSize:_totalSizeEditingController!.text,
        dcPurchasePerSecondaryUnitPrice: double.parse(_ppSecondaryUnitEditingController!.text),
        dSalePerSecondaryUnitPrice: double.parse(_tpSecondaryUnitEditingController!.text),
        isProductGroupID: groups.indexOf(product_group_value),
        sCode: _codeEditingController!.text,
        sProductLocation: _locationEditingController!.text,
        iSecondaryUnit: sunits.indexOf(secondary_unit_value),
        sTotalPeace: _secondaryUnitQtyEditingController!.text,
        dcPurcasePerBaseUnitPrice: double.parse(_ppPrimaryUnitEditingController!.text),
        dcSalePerBaseUnitPrice: double.parse(_tpPrimaryUnitEditingController!.text),
        sOpeningStockBaseUnit: _osPrimaryUnitEditingController!.text,
        bStatus: true,
          iProductID:0,
          iFirmID:0,
          iSystemUserID:0,
           isTaxcodeID:0,
          isExtraChargesID:0,
            sProduct_image:"",
          sImage_Thumbnail:"",
          sOpeningStockSecondaryUnit:"",
          sOpeningStockPurchase_At:"",
          sTotalBaseUnitStockQty:"",
          sTotalSecondaryUnitStockQty:"",
          sTotalBaseUnitPurchaseValue:"",
          sTotalSecondaryUnitPurchaseValue:"",
          sProducttype:"",
          sBaseUnitProfitRatio:"",
          sSecoundaryUnitProfitRatio:"",
          sTotalBaseUnitAvgPP:"",
          sTotalSecUnitAvgPP:"",
          sBonusRecivedStockInBaseUnit:"",
          sBonusRecivedStockInSecondaryUnit:"",
          sTotalBonusGivenStockOutInBaseUnit:"",
          sTotalBonusGivenStockOutInSecUnit:"",
          sTotalStockWithBonusInBaseUnitQty:"",
          sTotalStockWithBonusInSecUnitQty:"",
        dtCreatedDate: DateTime.now().toString(),
      );

      dbHelper!.saveProductData(pModel).then((value){
        if(value!=null){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Data saved Successfully")));
        }else{
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Failed")));
        }

      }).catchError((onError) {
        print(onError);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $onError")));
      });
    }
  }
}
