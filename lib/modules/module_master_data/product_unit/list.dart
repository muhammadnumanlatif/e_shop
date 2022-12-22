import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';

class ListofUnits extends StatefulWidget {
  const ListofUnits({Key? key}) : super(key: key);

  @override
  State<ListofUnits> createState() => _ListofUnitsState();
}

class _ListofUnitsState extends State<ListofUnits> {

  DbHelper? dbHelper;

  @override
  void initState() {
    dbHelper=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper!.getProductUnit(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${data[index]["sUnitName"]}"),
                  subtitle: Text("${data[index]["sUnitShortName"]}"),
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