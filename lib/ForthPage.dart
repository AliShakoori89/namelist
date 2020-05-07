import 'package:flutter/material.dart';

class ForthPage extends StatelessWidget {

  var text;
  var text1;
  var text2;
  var text3;


  ForthPage(this.text,this.text1,this.text2,this.text3);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Search Result'),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 15.0 , right: 15.0),
            child: Card(
//            child: Padding(padding: const EdgeInsets.symmetric(vertical: 320 , horizontal: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding (padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 50),
                      child: Text (text)
                  ),
                  Padding (padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 50),
                      child: Text (text1)
                  ),
                  Padding (padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 50),
                      child: Text (text2)
                  ),
                  Padding (padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 50),
                      child: Text ("$text3")
                  ),
                ],
              ),
//            ),
            )
        ),


      ),
      theme: ThemeData.dark(),
    );
  }
}