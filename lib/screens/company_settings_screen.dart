import 'package:flutter/material.dart';

class CompanySettingScreen extends StatefulWidget {
  const CompanySettingScreen({Key? key}) : super(key: key);

  @override
  State<CompanySettingScreen> createState() => _CompanySettingScreenState();
}

class _CompanySettingScreenState extends State<CompanySettingScreen> {
  @override
  Widget build(BuildContext context) {
return const Center(child: Text("Company Setting"));
  }
}

