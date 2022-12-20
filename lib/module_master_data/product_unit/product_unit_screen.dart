import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class ProductUnitScreen extends StatefulWidget {
  const ProductUnitScreen({Key? key}) : super(key: key);

  @override
  State<ProductUnitScreen> createState() => _ProductUnitScreenState();
}

class _ProductUnitScreenState extends State<ProductUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Product Unit"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddProductUnit(),
          ListofUnits()
        ]),
      ),
    );
  }
}




