import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';

class ListofCompany extends StatefulWidget {
  const ListofCompany({Key? key}) : super(key: key);

  @override
  State<ListofCompany> createState() => _ListofCompanyState();
}

class _ListofCompanyState extends State<ListofCompany> {
  DbHelper? dbHelper;

  @override
  void initState() {
    dbHelper=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper!.getProductCompany(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${data[index]["sCompanyName"]}"),
                  subtitle: Text("${data[index]["sCode"]}"),
                  leading: IconButton(onPressed: (){},icon: Icon(Icons.edit),),
                  trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete),),
                );
              },
            );
          }else {
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }
}