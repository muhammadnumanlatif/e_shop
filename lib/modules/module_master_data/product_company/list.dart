import 'package:flutter/material.dart';

class ListofCompany extends StatefulWidget {
  const ListofCompany({Key? key}) : super(key: key);

  @override
  State<ListofCompany> createState() => _ListofCompanyState();
}

class _ListofCompanyState extends State<ListofCompany> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("List of Company"),
    );
  }
}