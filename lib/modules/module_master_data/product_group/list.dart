import 'package:flutter/material.dart';

class ListofProduct extends StatefulWidget {
  const ListofProduct({Key? key}) : super(key: key);

  @override
  State<ListofProduct> createState() => _ListofProductState();
}

class _ListofProductState extends State<ListofProduct> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("List of Company"),
    );
  }
}
