
import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class SaleAreaScreen extends StatefulWidget {
  const SaleAreaScreen({Key? key}) : super(key: key);

  @override
  State<SaleAreaScreen> createState() => _SaleAreaScreenState();
}

class _SaleAreaScreenState extends State<SaleAreaScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Sale Area"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body:  TabBarView(children: [
          AddSaleArea(),
          ListofSaleArea(),
        ]),
      ),
    );
  }
}




