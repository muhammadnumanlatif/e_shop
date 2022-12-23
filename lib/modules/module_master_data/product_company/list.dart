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
               // return Expanded(
               //   child: Container(
               //      margin: EdgeInsets.all(20),
               //      child: Table(
               //        defaultColumnWidth: FixedColumnWidth(120.0),
               //        border: TableBorder.all(
               //            color: Colors.black, style: BorderStyle.solid, width: 2),
               //        children: [
               //          TableRow(children: [
               //            Column(
               //              children: [
               //                Text(
               //                  'Website',
               //                  style: TextStyle(
               //                      color: Colors.black,
               //                      fontSize: 20.0),
               //                ),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text(
               //                  'Tutorial',
               //                  style: TextStyle(fontSize: 20.0),
               //                ),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text(
               //                  'Review',
               //                  style: TextStyle(fontSize: 20.0),
               //                ),
               //              ],
               //            ),
               //          ]),
               //          TableRow(children: [
               //            Column(
               //              children: [
               //                Text('https://flutter.dev/'),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text('Flutter'),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text('5*'),
               //              ],
               //            ),
               //          ]),
               //          TableRow(children: [
               //            Column(
               //              children: [
               //                Text('https://dart.dev/'),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text('Dart'),
               //              ],
               //            ),
               //            Column(
               //              children: [
               //                Text('5*'),
               //              ],
               //            ),
               //          ]),
               //        ],
               //      ),
               //    ),
               // );

              },
            );
          }else {
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }
}