
import 'package:flutter/material.dart';

import 'add.dart';
import 'list.dart';

class ExpenseTypeScreen extends StatefulWidget {
  const ExpenseTypeScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseTypeScreen> createState() => _ExpenseTypeScreenState();
}

class _ExpenseTypeScreenState extends State<ExpenseTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Expense Type"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text:"Add.",icon: Icon( Icons.add),),
              Tab(text:"List",icon: Icon( Icons.list),),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddExpenseType(),
          ListofExpenseType()
        ]),
      ),
    );
  }
}