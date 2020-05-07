import 'package:flutter/material.dart';

import 'SearchScreen.dart';
import 'database.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  var controller = new TextEditingController();
  var text;
  var text1 = '';
  var text2 = '';
  var text3 = '';
  var text4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding (padding: const EdgeInsets.symmetric(
                vertical: 50.0, horizontal: 30.0),
              child: TextField (
                cursorColor: Colors.deepOrange,
                maxLength: 25,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search Field',
                  icon: Icon(
                    Icons.person, color: Colors.grey,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            Padding (padding: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 30.0),
              child: RaisedButton (
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(
                        18.0),
                    side: BorderSide(
                        color: Colors.deepOrange)
                ),
                onPressed: () {
                searchID ();
              },
                child: Text ('Search'),
              ),
            ),
//          Padding(padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
//            child: Text('text:$text'),
//          )
          ],
        ),
      ),
      theme: ThemeData.dark (),
    );
  }
  void initState() {
    // TODO: implement initState
    controller.addListener((){
      print('text: ${controller.text}');
    });
  }

  void searchID() async{
    var field = controller.text;
    print(field);
    final dbHelper = DatabaseHelper.instance;
    var st = await dbHelper.search(field);
    text = st.id;
    text1 = st.name;
    text2 = st.lastname;
    text3 = st.email;
    text4 = st.phonenumber;

    print(text);
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SearchScreen(text,text1,text2,text3,text4)));
  }

}
