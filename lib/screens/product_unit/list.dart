import 'package:flutter/material.dart';

class ListofUnits extends StatefulWidget {
  const ListofUnits({Key? key}) : super(key: key);

  @override
  State<ListofUnits> createState() => _ListofUnitsState();
}

class _ListofUnitsState extends State<ListofUnits> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("List of Company"),
    );
  }
}