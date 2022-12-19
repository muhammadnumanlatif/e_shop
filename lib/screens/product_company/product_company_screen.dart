
import 'package:e_shop/widgets/custom_button_widget.dart';
import 'package:e_shop/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add.dart';
import 'list.dart';

class ProductCompanyScreen extends StatefulWidget {
  const ProductCompanyScreen({Key? key}) : super(key: key);

  @override
  State<ProductCompanyScreen> createState() => _ProductCompanyScreenState();
}

class _ProductCompanyScreenState extends State<ProductCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Product Company"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddCompany(),
          ListofCompany()
        ]),
      ),
    );
  }
}

