import 'package:e_shop/database_handler/dbHelper.dart';
import 'package:flutter/material.dart';

class ListofSaleArea extends StatefulWidget {
  const ListofSaleArea({Key? key}) : super(key: key);

  @override
  State<ListofSaleArea> createState() => _ListofSaleAreaState();
}

class _ListofSaleAreaState extends State<ListofSaleArea> {
  DbHelper? dbHelper;
  
  @override
  void initState() {
    dbHelper=DbHelper();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper!.getSaleArea(),
        builder: (context,snapshot){
          if(snapshot.hasData){
           var data = snapshot.data!;
           return ListView.builder(
             itemCount: data.length,
             itemBuilder: (context,index){
               return ListTile(
                 title: Text("${data[index]["sName"]}"),
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