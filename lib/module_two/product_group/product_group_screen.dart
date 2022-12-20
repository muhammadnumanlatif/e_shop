import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class ProductGroupScreen extends StatefulWidget {
  const ProductGroupScreen({Key? key}) : super(key: key);

  @override
  State<ProductGroupScreen> createState() => _ProductGroupScreenState();
}

class _ProductGroupScreenState extends State<ProductGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Product Category"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddProductGroup(),
          ListofProduct()
        ]),
      ),
    );
  }
}


