import 'package:flutter/material.dart';
import 'database.dart';
import 'dart:async';

class DeletPage extends StatefulWidget {
  @override
  _DeletPageState createState() => _DeletPageState();
}

class _DeletPageState extends State<DeletPage> {
  var controller = new TextEditingController();
  var text;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delete Page'),
        ),
        body: SnackBarPage(),
      ),
      theme: ThemeData.dark(),
    );
  }

  void initState() {
    // TODO: implement initState
    controller.addListener(() {
//      print('text: ${controller.text}');
    });
  }
}

class SnackBarPage extends StatelessWidget {

  var controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Padding(padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: TextField(
            cursorColor: Colors.deepOrange,
            maxLength: 25,
            controller: controller,
            decoration: InputDecoration (
                prefixIcon: Icon ( Icons.search , color: Colors.grey,),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child:RaisedButton(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.deepOrange)
          ),
//          onPressed: () async {
//            int st = await deleteID();
//            print('st = $st');
//            if (st == 0){
//              final snackBar =SnackBar(
//                content: Text('No ID available'),
//                action: SnackBarAction(
//                  label: 'Undo',
//                  onPressed: () {
//                    // Some code to undo the change.
//                      },
//                  ),
//              );
//              Scaffold.of(context).showSnackBar(snackBar);
//            }
//            else {
//              final snackBar = SnackBar (
//                content: Text ('Delete Successfuly!'),
//                action: SnackBarAction (
//                  label: 'Undo',
//                  onPressed: () {
//// Some code to undo the change.
//                  },
//                ),
//              );
//              Scaffold.of (context).showSnackBar (snackBar);
//            }
//          },
            child: Text ('Delete'),
          ),
        ),
        ],
      ),
    );
  }
//  Future<int> deleteID() async {
//    var field = controller.text;
//    final dbHelper = DatabaseHelper.instance;
//    final st = await dbHelper.Delete(field);
//    return st;
//  }

}
