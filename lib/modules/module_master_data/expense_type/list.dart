import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';


class ListofExpenseType extends StatefulWidget {
  const ListofExpenseType({Key? key}) : super(key: key);

  @override
  State<ListofExpenseType> createState() => _ListofExpenseTypeState();
}

class _ListofExpenseTypeState extends State<ListofExpenseType> {
  DbHelper? dbHelper;

  @override
  void initState() {
    dbHelper=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper!.getExpenseType(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${data[index]["sTypeName"]}"),
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
