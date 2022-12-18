
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class AddExpenseType extends StatefulWidget {
  const AddExpenseType({Key? key}) : super(key: key);

  @override
  State<AddExpenseType> createState() => _AddExpenseTypeState();
}

class _AddExpenseTypeState extends State<AddExpenseType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Enter Expense Type",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.w),
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height:
            54.h,
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
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Enter Expense Code",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Write Click Listener Code Here.
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 54.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Theme.of(context).primaryColor, Colors.grey.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListofExpenseType extends StatefulWidget {
  const ListofExpenseType({Key? key}) : super(key: key);

  @override
  State<ListofExpenseType> createState() => _ListofExpenseTypeState();
}

class _ListofExpenseTypeState extends State<ListofExpenseType> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("List of Company"),
    );
  }
}
