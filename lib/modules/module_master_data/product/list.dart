import 'package:flutter/material.dart';

import '../../../database_handler/dbHelper.dart';


class ListofProduct extends StatefulWidget {
  const ListofProduct({Key? key}) : super(key: key);

  @override
  State<ListofProduct> createState() => _ListofProductState();
}

class _ListofProductState extends State<ListofProduct> {
  DbHelper? dbHelper;

  @override
  void initState() {
    dbHelper=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper!.getProduct(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${data[index]["sProductName"]}"),
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
